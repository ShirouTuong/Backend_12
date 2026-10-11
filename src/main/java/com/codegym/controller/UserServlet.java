package com.codegym.controller;

import com.codegym.dao.UserDAO;
import com.codegym.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(name = "UserServlet", urlPatterns = "/users/*")
public class UserServlet extends HttpServlet {
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setUtf8(request, response);
        String action = request.getPathInfo() == null ? "/" : request.getPathInfo();
        try {
            switch (action) {
                case "/new":
                    request.setAttribute("user", new User());
                    request.getRequestDispatcher("/user-create.jsp").forward(request, response);
                    break;
                case "/edit":
                    showUser(request, response, false);
                    break;
                case "/delete":
                    showUser(request, response, true);
                    break;
                case "/":
                    listUsers(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException exception) {
            throw new ServletException("Unable to access user records", exception);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setUtf8(request, response);
        String action = request.getPathInfo() == null ? "/" : request.getPathInfo();
        try {
            switch (action) {
                case "/create":
                    saveUser(request, response, false);
                    break;
                case "/update":
                    saveUser(request, response, true);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException exception) {
            throw new ServletException("Unable to access user records", exception);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String country = trim(request.getParameter("country"));
        boolean sortByName = "name".equals(request.getParameter("sort"));
        List<User> users = userDAO.findAll(country, sortByName);
        request.setAttribute("countryFilter", country);
        request.setAttribute("sortByName", sortByName);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/user-list.jsp").forward(request, response);
    }

    private void showUser(HttpServletRequest request, HttpServletResponse response, boolean deleting)
            throws SQLException, ServletException, IOException {
        Integer id = parseId(request.getParameter("id"));
        if (id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        User user = userDAO.findById(id);
        if (user == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher(deleting ? "/user-delete.jsp" : "/user-edit.jsp")
                .forward(request, response);
    }

    private void saveUser(HttpServletRequest request, HttpServletResponse response, boolean updating)
            throws SQLException, ServletException, IOException {
        Integer id = updating ? parseId(request.getParameter("id")) : null;
        if (updating && id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        User user = new User();
        if (updating) {
            user.setId(id);
        }
        user.setName(trim(request.getParameter("name")));
        user.setEmail(trim(request.getParameter("email")));
        user.setCountry(trim(request.getParameter("country")));
        String error = validate(user);
        if (error != null) {
            request.setAttribute("user", user);
            request.setAttribute("error", error);
            request.getRequestDispatcher(updating ? "/user-edit.jsp" : "/user-create.jsp")
                    .forward(request, response);
            return;
        }

        if (updating) {
            if (!userDAO.update(user)) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
        } else {
            userDAO.insert(user);
        }
        response.sendRedirect(request.getContextPath() + "/users");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Integer id = parseId(request.getParameter("id"));
        if (id == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        if (!userDAO.delete(id)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/users");
    }

    private String validate(User user) {
        if (user.getName().isEmpty() || user.getName().length() > 120) {
            return "Name is required and must be no longer than 120 characters.";
        }
        if (user.getEmail().isEmpty() || user.getEmail().length() > 220
                || !EMAIL_PATTERN.matcher(user.getEmail()).matches()) {
            return "Enter a valid email address (maximum 220 characters).";
        }
        if (user.getCountry().isEmpty() || user.getCountry().length() > 120) {
            return "Country is required and must be no longer than 120 characters.";
        }
        return null;
    }

    private Integer parseId(String value) {
        try {
            int id = Integer.parseInt(value);
            return id > 0 ? id : null;
        } catch (NumberFormatException | NullPointerException exception) {
            return null;
        }
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }

    private void setUtf8(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }
}