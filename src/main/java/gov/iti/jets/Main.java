package gov.iti.jets;

import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
        System.out.println("smt = " + System.getenv("SMT"));
        System.out.println("args = " + Arrays.toString(args));
    }
}