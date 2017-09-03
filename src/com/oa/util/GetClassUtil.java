package com.oa.util;

import com.oa.model.ModelColumnName;

import java.util.*;

/**
 * Created by 39805 on 2017/9/3.
 */
public class GetClassUtil {
    public void setMcnsName(List<ModelColumnName> mcns) {
        for (int i = 0; i < mcns.size(); i++) {
            String[] arr = mcns.get(i).getColumnName().split("\\.");
            if (arr.length == 1) {
                mcns.get(i).setColumnName(arr[0]);
            } else {
                mcns.get(i).setColumnName(arr[1]);
            }
        }
    }

    public List<ClassUtil> getClassUtil(List<ModelColumnName> mcns) {
        List<ClassUtil> cus = new ArrayList<ClassUtil>();
        StringSameCount ssc = new StringSameCount();
        List<String> strs = new ArrayList<String>();
        for (ModelColumnName mcn : mcns) {
            String[] arr = mcn.getColumnName().split("\\.");
            strs.add(arr[0]);
        }
        for (int i = 0; i < strs.size(); i++) {
            ssc.hashInsert(strs.get(i));
        }
        Map map = ssc.getMap();
        Iterator it = map.keySet().iterator();
        String temp;
        while (it.hasNext()) {
            temp = (String) it.next();
            ClassUtil cu = new ClassUtil();
            cu.setName(temp);
            cu.setNum((int) map.get(temp));
            cus.add(cu);

            // System.out.println(temp + "出现了" + map.get(temp) + "次");
        }
        // System.out.println(map);
        return cus;
    }
}

class StringSameCount {
    private Map map;
    private int counter;

    public StringSameCount() {
        map = new LinkedHashMap<String, Integer>();
    }

    public void hashInsert(String string) {
        if (map.containsKey(string)) {   //判断指定的Key是否存在
            counter = (Integer) map.get(string);  //根据key取得value
            map.put(string, ++counter);
        } else {
            map.put(string, 1);
        }
    }

    public Map getMap() {
        return map;
    }
}