/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

//Delete Agent when converting Agent to Admin, and Create Agent when converting Admin to Agent
import Models.Agent;
import Models.CType;
import Models.Location;
import Models.SQLCommands;
import Models.User;
import Models.UserType;
import com.sun.jndi.toolkit.ctx.Continuation;
import dao.PrintMarkingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
    HttpSession sessionObj = null;
    User user;
    boolean loggedIn;

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
            if(!sessionObj.isNew()){
                loggedIn = true;
            }
            
            boolean admin = loggedIn?false:((User) sessionObj.getAttribute("userSession")).userType.equals(UserType.ADMIN);
            while (true) {
                switch (servletPath) {
                    case "/register": // 
                    case "/login":
                        if (!loggedIn) {
                            login(request, response);
                        } else {
                            //error = ErrorType.ALREADY_LOGGEDIN_ERROR;
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
                            //error = ErrorType.PRIVLEGE_EERROR;
                            servletPath = "Error";
                            continue;
                        }
                    case "/updateTable"://Insert, Update 
                        updateTable(request, response);
                        break;
                    case "/delete": // delete
                        delete(request, response);
                        break;
                    case "/listTable": // list table
                        listTable(request, response);
                        break;
                    case "Error": // Error page
                    default:
                       
                        response.sendRedirect("Login.jsp");
                }
                break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MainServlets.class.getName()).log(Level.SEVERE, null, ex);
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
        if (request.getParameter("Id") != null) { // id should not be -1 to update
            Id = Integer.valueOf(request.getParameter("Id"));
        }
        switch (CType.getCType(request.getParameter("Id"))) {
            case LOCATION:
                printMarkingDAO.SqlCommand(new Location(Id, request.getParameter("locationName"), Integer.valueOf(request.getParameter("distributionCapacity"))));
                break;
            case AGENT:
                printMarkingDAO.SqlCommand(new Agent(Id, request.getParameter("lastName"), request.getParameter("firstName"), request.getParameter("phoneNumb"), request.getParameter("email")));
            case USER:
                printMarkingDAO.SqlCommand(new User(Id, request.getParameter("userName"), UserType.getUserType(Integer.valueOf(request.getParameter("userType")))));
                break;
        }
        response.sendRedirect("listTable");
    }

    private void Error(ErrorType error, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
        request.setAttribute("errorMsg", error.toString());
        dispatcher.forward(request, response);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        user = printMarkingDAO.logIn(request.getParameter("userName"), request.getParameter("password"));
        if (user != null) {
            sessionObj.setAttribute("userSession", user);
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
    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        SQLCommands temp = search(Integer.valueOf(request.getParameter("Id")), CType.getCType(request.getParameter("CType")));

        RequestDispatcher dispatcher;

        switch (temp.cType) {
            case LOCATION:
                dispatcher = request.getRequestDispatcher("LocationForm.jsp");
                request.setAttribute("locationObj", (Location) temp);
                break;
            case AGENT:
            case USER:
                //not sure where to send
                dispatcher = request.getRequestDispatcher("UnKown.jsp");
                if (((User) temp).userType.equals(UserType.AGENT)) {
                    ((User) temp).setAgent((Agent) search(temp.ID, CType.AGENT));
                }
                request.setAttribute("userObj", (User) temp);
                break;
            default:
                dispatcher = null;
        }
        dispatcher.forward(request, response);
    }

    //Works for all Tables
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // this method will get the value from the "Admin.jsp" textbox and  
        printMarkingDAO.SqlCommand(new SQLCommands(Integer.valueOf(request.getParameter("Id")), CType.getCType(request.getParameter("CType")), false));
        response.sendRedirect("listTable");
    }

    //Add if else
    private void listTable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //if 
        List<Location> locate = printMarkingDAO.SqlCommandLocationSearch();
        request.setAttribute("listLocate", locate);
        //else
        //List<Other> other = printMarkingDAO.SqlCommandLocationSearch();
        //request.setAttribute("listLocate", other);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin.jsp");
        dispatcher.forward(request, response);

    }
}
