package ua.yunyk;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ua.yunyk.domain.User;
import ua.yunyk.service.UserService;
import ua.yunyk.service.impl.UserServiceImpl;

@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserServiceImpl();
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = userService.readByParameter(email);
		if (user == null) {
			request.setAttribute("errorMessage",
					"<br>There is no users with entered email<br> <a href=\"Registration.jsp\">Registration</a>");
			request.setAttribute("email", "e");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (!(user.getPassword().equals(password))) {
			request.setAttribute("email", user.getEmail());
			request.setAttribute("errorMessage",
					"<br>Password entered wrong <br> <a href=\"Registration.jsp\">Registration</a>");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.setAttribute("firstName", user.getFirstName());
			request.getRequestDispatcher("cabinet.jsp").forward(request, response);
		}

	}

}
