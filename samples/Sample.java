package com.islands.dark;

import java.util.List;
import java.util.ArrayList;

/**
 * Sample class demonstrating Islands Dark theme highlighting.
 * @author Islands Dark
 * @version 1.0
 */
public class Sample extends BaseClass implements Runnable {

    private static final int MAX_COUNT = 100;
    private static final double PI = 3.14159;
    private String name;

    @Override
    public void run() {
        System.out.println("Running sample...");
    }

    public List<String> processItems(int count, String prefix) {
        List<String> items = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            String item = prefix + "_item_" + i;
            items.add(item);
        }
        return items;
    }

    public static double calculateArea(double radius) {
        // Calculate circle area
        if (radius <= 0.0) {
            throw new IllegalArgumentException("Radius must be positive");
        }
        return PI * radius * radius;
    }

    @Deprecated
    public void oldMethod() {
        /* This is a block comment
           spanning multiple lines */
        int hex = 0xFF;
        int octal = 077;
        long big = 9999999999L;
    }
}