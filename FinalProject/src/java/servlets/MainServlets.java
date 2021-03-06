/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

//Delete Agent when converting Agent to Admin, and Create Agent when converting Admin to Agent
import Models.Agent;
import Models.*;
import Models.CType;
import Models.Location;
import Models.SQLCommands;
import Models.User;
import Models.UserType;
import com.sun.jndi.toolkit.ctx.Continuation;
import dao.PrintMarkingDAO;
import java.awt.Button;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class MainServlets extends HttpServlet {

    PrintMarkingDAO printMarkingDAO;
    HttpSession sessionObj;
    User user;
    boolean loggedIn, admin;

    public void init() { // initializing the jdbc's url,username, and password in the studentDAO class so that class can connect to the database
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

        printMarkingDAO = new PrintMarkingDAO(jdbcURL, jdbcUsername, jdbcPassword);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath();
        try {
            ErrorType error = ErrorType.ERROR404;
            sessionObj = request.getSession();
            if (sessionObj.getAttribute("userSession") != null) {
                loggedIn = true;
            }

            if (loggedIn) {
                admin = ((User) sessionObj.getAttribute("userSession")).userType.equals(UserType.ADMIN);
            }
            while (true) {
                switch (servletPath) {
                    case "/register": // 
                    case "/login":
                        if (!loggedIn) {
                            login(request, response);
                        } else {
                            error = ErrorType.ALREADY_LOGGEDIN_ERROR;
                            servletPath = "Error";
                            continue;
                        }
                        break;
                    case "/logout":
                        if (loggedIn) {
                            logout(request, response);
                        } else {
                            servletPath = "/login";
                            continue;
                        }
                        break;
                    case "/admin":
                        if (!loggedIn) {
                            servletPath = "/login";
                            continue;
                        } else if (!admin) {
                            error = ErrorType.PRIVLEGE_EERROR;
                            servletPath = "Error";
                            continue;
                        }
                        admin(request, response);
                        break;
                    case "/agent":
                        if (!loggedIn) {
                            servletPath = "/login";
                            continue;
                        } else if (admin) {
                            servletPath = "/admin";
                            continue;
                        }
                        //agent(request, response);
                        break;
                    case "/updateTable"://Insert, Update 
                        if (!loggedIn) {
                            servletPath = "/login";
                            continue;
                        }
                        updateTable(request, response);
                        break;
                    case "/objectForm":
                        if (!loggedIn) {
                            servletPath = "/login";
                            continue;
                        }
                        objectForm(request, response);
                        break;
                    case "/delete": // delete
                        if (!loggedIn) {
                            servletPath = "/login";
                            continue;
                        }
                        delete(request, response);
                        break;
                    case "Error": // Error page
                    default:
                        if (loggedIn) {
                            Error(error, request, response);
                        } else {
                            response.sendRedirect("Login.jsp");
                        }
                }
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MainServlets.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    //Works for all Tables
    private void updateTable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // this method is used to update and insert 
        int Id = -1;
        if (request.getParameter("id") != null) { // id should not be -1 to update
            Id = Integer.valueOf(request.getParameter("id"));
        }
        switch (CType.getCType(request.getParameter("cType"))) {
            case LOCATION:
                printMarkingDAO.SqlCommand(new Location(Id, request.getParameter("locationName"), Integer.valueOf(request.getParameter("distributionCapacity"))));
                break;
            case AGENT: // update Agent Tble from AgentForm and then update the current userSession
                printMarkingDAO.SqlCommand(new Agent(((User) sessionObj.getAttribute("userSession")).ID, request.getParameter("lastName"), request.getParameter("firstName"), request.getParameter("phoneNumb"), request.getParameter("email")));
                ((User) sessionObj.getAttribute("userSession")).setAgent((Agent) search(((User) sessionObj.getAttribute("userSession")).ID, CType.AGENT));
            case USER:
                printMarkingDAO.SqlCommand(new User(Id, request.getParameter("userName"), UserType.getUserType(Integer.valueOf(request.getParameter("userType")))));
                break;
        }
        response.sendRedirect(request.getParameter("Redirect"));
    }

    private void objectForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");;
        switch (CType.getCType(request.getParameter("cType"))) {
            case LOCATION:
                dispatcher = request.getRequestDispatcher("LocationForm.jsp");
                if (Integer.valueOf(request.getParameter("Id")) != -1) {
                    Location test = (Location) search(Integer.valueOf(request.getParameter("Id")), CType.LOCATION);
                    request.setAttribute("locationObj", test);
                }
                break;
            case AGENT:
                if (Integer.valueOf(request.getParameter("Id")) != -1) {
                    dispatcher = request.getRequestDispatcher("AgentForm.jsp");
                    request.setAttribute("agentObj", (Agent) search(Integer.valueOf(request.getParameter("Id")), CType.AGENT));
                }
                break;
            case USER:
                dispatcher = request.getRequestDispatcher("UserForm.jsp");
                if (Integer.valueOf(request.getParameter("Id")) != -1) {
                    request.setAttribute("userObj", (User) search(Integer.valueOf(request.getParameter("Id")), CType.CLIENT));
                }
                break;
            case CLIENT:
                dispatcher = request.getRequestDispatcher("ClientForm.jsp");
                if (Integer.valueOf(request.getParameter("Id")) != -1) {
                    request.setAttribute("clientObj", (Client) search(Integer.valueOf(request.getParameter("Id")), CType.CLIENT));
                }
                break;
            case ORDER:
                dispatcher = request.getRequestDispatcher("OrderForm.jsp");
                if (Integer.valueOf(request.getParameter("Id")) != -1) {
                    request.setAttribute("orderObj", (Order) search(Integer.valueOf(request.getParameter("Id")), CType.ORDER));
                }
                break;
        }
        request.setAttribute("Id", request.getParameter("Id"));
        dispatcher.forward(request, response);
    }

    private void Error(ErrorType error, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
        request.setAttribute("errorMsg", error.toString());
        dispatcher.forward(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // check to see if the value is the same as it is in the database
        user = printMarkingDAO.logIn(request.getParameter("userName"), request.getParameter("password"));
        if (user != null) {
            sessionObj.setAttribute("userSession", user);
            if (user.userType.equals(UserType.ADMIN)) {
                admin(request, response);
            } else {

            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
            request.setAttribute("errorMsg", "Incorrect Login");
            dispatcher.forward(request, response);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        sessionObj.removeAttribute("UsernameStringKey");
        response.sendRedirect("Login.jsp");
    }

    private SQLCommands search(int Id, CType cType) throws ServletException, IOException, SQLException {
        return printMarkingDAO.SqlCommand(new SQLCommands(Id, cType, true));
    }

    //Works for all Tables
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // this method will get the value from the "Admin.jsp" textbox and  
        printMarkingDAO.SqlCommand(new SQLCommands(Integer.valueOf(request.getParameter("Id")), CType.getCType(request.getParameter("CType")), false));
        response.sendRedirect(request.getParameter("Redirect"));
    }

    //Add if else
    private void admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        CType cType = CType.getCType(request.getParameter("tableType"));
        ArrayList<SQLCommands> tableView = printMarkingDAO.getTable(cType);
        request.setAttribute("tableListType", cType.getTable());

        switch (cType) {
            case LOCATION:
                request.setAttribute("tableListLocation", (new ArrayList<Location>((Collection) tableView)));
                break;
            case AGENT:
                request.setAttribute("tableListAgent", (new ArrayList<Agent>((Collection) tableView)));
                break;
            case USER:
                request.setAttribute("tableListUser", (new ArrayList<User>((Collection) tableView)));
                break;
            case CLIENT:
                request.setAttribute("tableListClient", (new ArrayList<Client>((Collection) tableView)));
                break;
            case ORDER:
                request.setAttribute("tableListOrder", (new ArrayList<Client>((Collection) tableView)));
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin.jsp");
        dispatcher.forward(request, response);

    }
}
