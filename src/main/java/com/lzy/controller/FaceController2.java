package com.lzy.controller;

import com.lzy.domain.FaceResult;
import com.lzy.domain.Student;
import com.lzy.service.IStudentService;
import org.bytedeco.javacpp.*;
import org.opencv.imgproc.Imgproc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.IntBuffer;
import java.util.ArrayList;

import static org.bytedeco.javacpp.opencv_core.CV_32SC1;
import static org.bytedeco.javacpp.opencv_imgcodecs.imread;
import static org.bytedeco.javacpp.opencv_imgcodecs.imwrite;
import static org.bytedeco.javacpp.opencv_imgproc.resize;

/**
 * @author Answer
 * @description
 * @date 2020/05/06
 */
@Controller
@RequestMapping("/face2")
public class FaceController2 {
    @Autowired
    private IStudentService studentService;

    static {
        System.load("D:\\OpenCV\\opencv\\build\\java\\x64\\opencv_java341.dll");
    }

    @RequestMapping("/face2")

    public void face(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //加载检测器
        opencv_objdetect.CascadeClassifier face_cascade = new opencv_objdetect.CascadeClassifier("D:\\OpenCV\\opencv\\sources\\data\\haarcascades_cuda\\haarcascade_frontalface_alt.xml");//初始化人脸检测器

        String path = "C:\\Users\\Administrator\\Desktop\\Face";
        String path2 = "C:\\Users\\Administrator\\Desktop\\16\\Faces";

        //获取人脸库中图片
        ArrayList<File> files = new Face2().getFile(new File(path));

        int count = files.size();
        System.out.println(count);
        //创建人脸矩阵
        opencv_core.RectVector faces = new opencv_core.RectVector();
        //创建输入图片矩阵
        opencv_core.MatVector matVector = new opencv_core.MatVector(count);
        //创建标签
        //int[] lables = new int[count];

        opencv_core.Mat Gray = new opencv_core.Mat();
        opencv_core.Mat after = new opencv_core.Mat();
        opencv_core.Mat lables = new opencv_core.Mat(count, 1, CV_32SC1);
        IntBuffer lablesBuf = lables.createBuffer();

        for (int i = 0; i < count; i++) {
            System.out.println("i" + i);
            System.out.println(files.get(i).getPath());
            opencv_core.Mat imread = imread(files.get(i).getPath());
            if (imread.empty()) {
                System.out.println("没有图片");
            }
            //对图像进行灰度和直方均衡
            opencv_imgproc.cvtColor(imread, Gray, Imgproc.COLOR_BGRA2GRAY);
            opencv_imgproc.equalizeHist(Gray, Gray);

            face_cascade.detectMultiScale(imread, faces);

            String name = files.get(i).getName();
            String lable = files.get(i).getParentFile().getName();
            System.out.println(lable);
            // String lable = fileName.substring(6, fileName.lastIndexOf("."));
            int i1 = Integer.parseInt(lable);
            lablesBuf.put(i, i1);
            opencv_core.Rect rect = faces.get(0);
            opencv_core.Mat fa = new opencv_core.Mat(imread, rect);
            resize(imread, after, new opencv_core.Size(300, 300));
            if (imread.empty()) {
                System.out.println("没有脸");
            }

            matVector.put(i, after);
            imwrite(path2 + File.separator + name + " face.png", after);

        }

        opencv_face.EigenFaceRecognizer recognizer = opencv_face.EigenFaceRecognizer.create();
        recognizer.train(matVector, lables);

        recognizer.save("Recognize.xml");
        System.out.println("保存成功");


    }


    @RequestMapping("/recognizer2")
    @ResponseBody
    public FaceResult test(){
        System.out.println("开始识别");
        opencv_face.EigenFaceRecognizer recognizer = opencv_face.EigenFaceRecognizer.create();
        String path4 = "C:\\Users\\Administrator\\Desktop\\facetest";
        recognizer.read("Recognize.xml");
        recognizer.setThreshold(3000.0);
        //创建人脸矩阵
        opencv_core.RectVector faces = new opencv_core.RectVector();
        opencv_core.Mat Gray2 = new opencv_core.Mat();
        opencv_core.Mat after = new opencv_core.Mat();
        //获取图片对其预处理，灰度+直方均衡
        String path3="C:\\Users\\Administrator\\Desktop\\1.jpg";
        opencv_core.Mat imread = imread(path3);
        opencv_imgproc.cvtColor(imread, Gray2, Imgproc.COLOR_BGRA2GRAY);
        opencv_imgproc.equalizeHist(Gray2, Gray2);

        //加载检测器并获取人脸
        opencv_objdetect.CascadeClassifier face_cascade = new opencv_objdetect.CascadeClassifier("D:\\OpenCV\\opencv\\sources\\data\\haarcascades_cuda\\haarcascade_frontalface_alt.xml");//初始化人脸检测器
        face_cascade.detectMultiScale(Gray2, faces);
        opencv_core.Rect rect = faces.get(0);
        opencv_core.Mat fa = new opencv_core.Mat(Gray2,rect);
        //调整人脸图片大小
        resize(Gray2,after,new opencv_core.Size(300,300));
        //输出人脸图片
        imwrite(path4 + File.separator + "test" + " face.png", after);
        //识别
        IntPointer label = new IntPointer(1);
        DoublePointer confidence = new DoublePointer(1);
        recognizer.predict(after,label,confidence);
        //输出识别标签
        Integer predictedLabel = label.get(0);

        String s = predictedLabel.toString();
        FaceResult result = new FaceResult();
        if(predictedLabel==-1){
            result.setFlag(false);
            result.setMsg("识别失败");
        }
        if (predictedLabel!=-1){
            result.setFlag(true);
            result.setMsg("识别成功");
            Student student = new Student();
            student.setSno(s);
            Student byPhoto = studentService.findById(student);
            result.setName(byPhoto.getName());
            result.setRoomId(byPhoto.getRoomid());
            result.setInRoom(byPhoto.getInroom());
        }
        return result;
    }
}
