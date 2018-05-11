package com.stareatm.controller;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;


/**
 * Created by 刘 on 2018/5/3.
 */
public class Test {
    public static void main(String[] args) {
/*
        System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
*/
        Map<String,Integer> map=new TreeMap<>();
        Set<String> set=map.keySet();
        for (String str:set){
            System.out.println(str);
            System.out.println(map.get(str));
        }
        Iterator<String > it=set.iterator();
        while (it.hasNext()){
            String key=it.next();
            Integer value=map.get(key);
            System.out.println(key+"-"+value);
        }
        Set<Map.Entry<String,Integer>> entrySet=map.entrySet();
        for(Map.Entry<String,Integer> entry:entrySet){
            String key=entry.getKey();
            Integer value=entry.getValue();
            System.out.println(key+"-"+value);
        }
    }
}
