/*
 * Moffat Bay Capstone Project
 * Developed by:
 * - Celine Del Mundo
 * - Ryan Norrbom
 * - Eric Williams-Phillips
 */
package com.MoffatBayLodge.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HomeController doGet called");
        request.getRequestDispatcher("/view/Index.jsp").forward(request, response);
    }
}