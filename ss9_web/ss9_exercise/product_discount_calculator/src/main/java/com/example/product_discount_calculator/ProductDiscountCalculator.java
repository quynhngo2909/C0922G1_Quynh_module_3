package com.example.product_discount_calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "product_discount_calculator", value = "/product-discount-calculator")
public class ProductDiscountCalculator extends HttpServlet {

    public void init() {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        float listPrice = Float.parseFloat(request.getParameter("listPrice"));
        float discountPercent = Float.parseFloat(request.getParameter("discountPercent"));
        float discountAmount = listPrice * discountPercent /100;
        float discountPrice = listPrice - discountAmount;
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display-discount.jsp");
        requestDispatcher.forward(request,response);
    }
    public void destroy() {
    }
}
