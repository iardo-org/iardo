package com.iardo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iardo.model.BlogPost;
import com.iardo.service.ContentfulService;

@WebServlet("/blog")
public class BlogListServlet extends HttpServlet {

	private final ContentfulService service = new ContentfulService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, javax.servlet.ServletException {

		try {

			List<BlogPost> blogs = service.getAllBlogs();

			req.setAttribute("blogs", blogs);

			req.getRequestDispatcher("/article/index.jsp").forward(req, res);

		} catch (Exception e) {
			e.printStackTrace();

			req.setAttribute("error", e.getMessage());

			req.getRequestDispatcher("/article/index.jsp").forward(req, res);
		}
	}
}