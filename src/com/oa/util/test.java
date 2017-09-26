package com.oa.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class test {
    public static void main(String[] args) {

        int arr[] = {1, 2, 2, 3, 4, 5, 5, 5, 6, 6, 1, 2, 2, 2};
        int length = arr.length;

        Map csHead = new HashMap();
        int number = 1;
        for (int i = 0; i < length - 1; i++) {

            if (arr[i] == arr[i + 1]) {
                number += 1;
            } else {

                System.out.println(number + "__" + arr[i]);
                csHead.put(number, arr[i]);
                number = 1;
            }

            if (i == length - 2) {
                if (arr[length - 1] == arr[length - 2]) {
                    csHead.put(number, arr[i]);
                    System.out.println(number + "__" + arr[i]);
                } else {
                    csHead.put(1, arr[length - 1]);
                    System.out.println(number + "__" + arr[i]);
                }
            }
        }

        System.out.println(csHead.size());

        Set<Integer> keys = csHead.keySet();
        for (Integer k : keys) {
            System.out.println(k + "__" + csHead.get(k));
        }


        /*Set<Map<Integer,Integer>> map = cHead.entrySet();
        for (Map<Integer, Integer> m:map) {
            System.out.println(m);
        }*/

    }
}
