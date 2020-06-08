package com.lzy.controller;

import java.io.File;
import java.util.ArrayList;

/**
 * @author Answer
 * @description
 * @date 2020/05/11
 */
public class Face2 {
    ArrayList<File> arrayList = new ArrayList<>();



    /**
     * 读取库中所有图片
     * @param file
     * @return
     */
    public  ArrayList<File> getFile(File file){

        if (file.isFile()) {
            System.out.println("这是一个文件"); // 判断给定目录是否是一个合法的目录，如果不是，输出提示
        } else {
            File[] fileLists = file.listFiles(); // 如果是目录，获取该目录下的内容集合

            for (int i = 0; i < fileLists.length; i++) { // 循环遍历这个集合内容
                if (fileLists[i].isFile())
                //arrayList.add(fileLists[i]);//将图片存入集合
                arrayList.add(fileLists[i]);
                if (fileLists[i].isDirectory()) {    //判断元素是不是一个目录
                    getFile(fileLists[i]);    //如果是目录，继续调用本方法来输出其子目录
                }
            }


        }
        return arrayList;
    }

}
