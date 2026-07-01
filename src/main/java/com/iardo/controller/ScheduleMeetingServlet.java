package com.iardo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.iardo.dao.MeetingBookingDAO;
import com.iardo.model.MeetingBooking;

@WebServlet("/schedule-meeting")
public class ScheduleMeetingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String service = request.getParameter("service");
        String company = request.getParameter("company");
        String phone = request.getParameter("phone");
        String designation = request.getParameter("designation");
        String website = request.getParameter("website");

        // create model
        MeetingBooking b = new MeetingBooking();
        b.setName(name);
        b.setEmail(email);
        b.setDate(date);
        b.setTime(time);
        b.setCompany(company);
        b.setService(service);
        b.setTimezone("IST");
        b.setPhone(phone);
        b.setDesignation(designation);
        b.setWebsite(website);

        MeetingBookingDAO dao = new MeetingBookingDAO();

        try {
            dao.saveBooking(b);
            request.setAttribute("msg", "Meeting booked successfully!");
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("date", date);
            request.setAttribute("time", time);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Booking failed!");
        }

        request.getRequestDispatcher(
            "/noon-onboarding/schedule-meeting/booking-success.jsp"
        ).forward(request, response);
    }
}