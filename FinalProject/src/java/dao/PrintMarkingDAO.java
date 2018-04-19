/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Models.Agent;
import Models.*;
import Models.CType;
import Models.Location;
import Models.QType;
import Models.SQLCommands;
import Models.User;
import Models.UserType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class PrintMarkingDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public PrintMarkingDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    protected void connect() throws SQLException { // this method is used for to connect to the sql [by initialising the driver and the connection variable
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            System.out.println("Here is the connection: " + DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword));
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException { // this method is used to disconnect the SqlConnection meaning it simpley disconnects you from the sql database
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public User logIn(String userName, String password) throws SQLException {

        User toReturn = null;

        connect();

        Statement statement = jdbcConnection.createStatement();

        ResultSet resultSet = statement.executeQuery("SELECT * FROM user WHERE userName LIKE '" + userName + "' AND password LIKE '" + password + "'");

        if (resultSet.next()) {
            toReturn = new User(resultSet.getInt("id"), resultSet.getString("userName"), UserType.getUserType(resultSet.getInt("userType")));
        }

        return toReturn;
    }

    public SQLCommands SqlCommand(SQLCommands SQLCommand) throws SQLException {
        // the SQLCommands is represented as the parent class for every table/class
        // the command variable calls createCommand method from the QType and theis method takes a table name and the class 
        // the SqlCommand variable will type cast to the correct class 
        String command = SQLCommand.qType.createCommand(SQLCommand.cType.getTable(), SQLCommand); // the getOptional2 doesn't return the class ID

        SQLCommands toReturn = null;

        connect();

        Statement statement = jdbcConnection.createStatement();

        if (SQLCommand.qType.equals(QType.SEARCH)) {
            // if the sqlCommand object. qType variable equals "SEARCH" meaning check if the client wants to search 
            // then get the values from the database and add it to ResultSet 
            ResultSet resultSet = statement.executeQuery(command);

            Agent agentTemp = null;

            if (resultSet.next()) {
                switch (SQLCommand.cType) {
                    case LOCATION:
                        toReturn = new Location(resultSet.getInt("id"), resultSet.getString("locationName"), resultSet.getInt("distributionCapacity"));
                        break;
                    case USER:
                        toReturn = new User(resultSet.getInt("id"), resultSet.getString("userName"), UserType.getUserType(resultSet.getInt("userType")));
                        break;
                    case AGENT:
                        toReturn = new Agent(resultSet.getInt("id"), resultSet.getString("lastName"), resultSet.getString("firstName"), resultSet.getString("phoneNumb"), resultSet.getString("email"));
                        break;
                }
            } else {
                System.err.println("NO RESULT");
            }
        } else {
            // otherwise just execute (Insert, Update, or Delete) sqlCommand 
            statement.executeUpdate(command);
        }

        statement.close();
        disconnect();
        return toReturn;

    }

    public ArrayList<SQLCommands> getTable(CType cType) throws SQLException {

        //get all values from the Location table and add it to the table list
        String sql = "SELECT * FROM " + cType.getTable();

        ArrayList<SQLCommands> tableView = new ArrayList();

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) { // going through the result set
            switch (cType) {
                case LOCATION:
                    tableView.add(new Location(resultSet.getInt("id"), resultSet.getString("locationName"), resultSet.getInt("distributionCapacity")));
                    break;
                case AGENT:
                    tableView.add(new Agent(resultSet.getInt("id"), resultSet.getString("firstName"), resultSet.getString("lastName"), resultSet.getString("phoneNo"), resultSet.getString("email")));
                    break;
                case CLIENT:
                    tableView.add(new Client(resultSet.getInt("id"), resultSet.getString("firstName"), resultSet.getString("lastName"), resultSet.getInt("streetNumber"), resultSet.getString("streetName"), resultSet.getString("city"), resultSet.getString("province"), resultSet.getString("postalCode"), resultSet.getString("telOffice"), resultSet.getString("telCell"), resultSet.getString("email"), resultSet.getString("company"), resultSet.getString("companyType")));
                    break;
                case ORDER:
                    tableView.add(new Order(resultSet.getInt("id"), resultSet.getInt("agentId"), resultSet.getInt("clientId"), resultSet.getInt("flyerQty"), resultSet.getString("flyerLayout"), resultSet.getBlob("flyerImg"), resultSet.getInt("personalCopy"), resultSet.getString("paymentInformation"), resultSet.getString("invoiceNumber"), resultSet.getString("comments"), resultSet.getInt("isFlyerArtApproved"), resultSet.getInt("isPaymentReceived")));
                    break;
                case USER:
                    tableView.add(new User(resultSet.getInt("id"), resultSet.getString("userName"), UserType.getUserType(resultSet.getInt("userType"))));
                    break;
            }
        }

        resultSet.close();
        statement.close();

        disconnect();

        return tableView;
    }

}
