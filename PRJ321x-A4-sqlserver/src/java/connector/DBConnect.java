/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author AMIN
 */
public class DBConnect {
    
    private final String host = "localhost";
    private final String port = "1433";
    private final String dbName = "BlogDB";
    private final String username = "sa";
    private final String password = "1234567890";
    
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionUrl = "jdbc:sqlserver://" + host + ":" + port + ";databaseName=" + dbName;
        return DriverManager.getConnection(connectionUrl, username, password);
    }
    
}
