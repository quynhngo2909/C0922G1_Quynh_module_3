package com.example.simple_calculator;

import exception.DivideByZeroException;

public class CalculatorMethod {
    public static float calculator(float firstOperand, float secondOperand, String operator) {
        switch (operator) {
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                    if (secondOperand == 0){
                    throw new DivideByZeroException("Error! Can not divide by zero");
                } else {
                    return firstOperand / secondOperand;
                }
            default:
                throw new RuntimeException("Invalid operator");
        }
    }
}
