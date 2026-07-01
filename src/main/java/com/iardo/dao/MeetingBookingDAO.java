package com.iardo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.iardo.config.DBConnection;
import com.iardo.model.MeetingBooking;

public class MeetingBookingDAO {

    public void saveBooking(MeetingBooking booking) throws SQLException {

        String sql = """
            INSERT INTO meeting_bookings
            (meeting_date, meeting_time, timezone, name, email, phone, service, company, designation, website)
            VALUES (?,?,?,?,?,?,?,?,?,?)
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, booking.getDate());
            ps.setString(2, booking.getTime());
            ps.setString(3, booking.getTimezone());
            ps.setString(4, booking.getName());
            ps.setString(5, booking.getEmail());
            ps.setString(6, booking.getPhone());
            ps.setString(7, booking.getService());
            ps.setString(8, booking.getCompany());
            ps.setString(9, booking.getDesignation());
            ps.setString(10, booking.getWebsite());

            ps.executeUpdate();
        }
    }
}