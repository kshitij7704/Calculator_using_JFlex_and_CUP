package com.example;

import java.io.StringReader;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        while (true) {
            System.out.print("Enter expression (or 'exit' to quit): ");
            String input = scanner.nextLine().trim();
            
            if (input.equalsIgnoreCase("exit")) {
                break;
            }
            
            try {
                Lexer lexer = new Lexer(new StringReader(input));
                Parser parser = new Parser(lexer);
                Integer result = (Integer) parser.parse().value;
                System.out.println("Result: " + result);
            } catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
            }
            System.out.println();
        }
        
        scanner.close();
    }
}