/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import managers.MovieManager;
import models.Account;
import models.PlayingMovie;
import models.Review;

/**
 *
 * @author Shawn
 */
public class reviewPage extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sess = request.getSession();
        PlayingMovie pm = (PlayingMovie) sess.getAttribute("movie");
        String title = pm.getTitle();
        MovieManager mm = (MovieManager) request.getServletContext().getAttribute("movieManager");
        PlayingMovie pm2 = mm.findMovie(title);
        String reviews = "";
        if(pm2 != null && pm2.getReviews() != null) {
            reviews=pm2.getReviews();
        }
        List li = new ArrayList();
        if(reviews!=null)
            li = convertReviews(reviews);
        if(li!=null) {
            Review review = new Review(li);
            sess.setAttribute("rev", review);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("../../JSP/review.jsp");
        dispatcher.forward(request, response);
    }
    
    public List convertReviews(String reviews) {
        List li = new ArrayList();
        String[] s = reviews.split("\t");
        
        li.addAll(Arrays.asList(s));
        return li;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
