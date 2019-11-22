/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbaccess;

import connector.DBConnect;
import entity.Posts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AMIN
 */
public class PostsDAO {
    
    public void addPost(Posts p) {
        try (Connection conn = new DBConnect().getConnection()) {
            String query = "insert into Post values (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, p.getTitle());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getContents());
            ps.setTimestamp(4, new Timestamp(p.getDate().getTime()));
            ps.setBoolean(5, p.isPublished());
            ps.setString(6, p.getUser());
            ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void editPost(Posts p, int id) {
        try (Connection conn = new DBConnect().getConnection()) {
            String query = "update Post set title = ?, description = ?, contents = ?, date = ?, published = ? where id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, p.getTitle());
            ps.setString(2, p.getDescription());
            ps.setString(3, p.getContents());
            ps.setTimestamp(4, new Timestamp(p.getDate().getTime()));
            ps.setBoolean(5, p.isPublished());
            ps.setInt(6, id);
            ps.execute();
        } catch (Exception ex) {
            Logger.getLogger(PostsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Posts> selectAll() {
        List<Posts> posts = new ArrayList<>();
        try (Connection conn = new DBConnect().getConnection()) {
            String query = "select * from Post";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String title = rs.getString(2);
                String description = rs.getString(3);
                String contents = rs.getString(4);
                Date date = new Date(rs.getTimestamp(5).getTime());
                boolean published = rs.getBoolean(6);
                String user = rs.getString(7);
                Posts p = new Posts(title, description, contents, date, published, user);
                posts.add(0, p);
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return posts;
    }
    
    public Posts selectById(int id) {
        Posts p = null;
        try (Connection conn = new DBConnect().getConnection()) {
            String query = "select * from Post where id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                String title = rs.getString(2);
                String description = rs.getString(3);
                String contents = rs.getString(4);
                Date date = new Date(rs.getTimestamp(5).getTime());
                boolean published = rs.getBoolean(6);
                String user = rs.getString(7);
                p = new Posts(title, description, contents, date, published, user);
            }
        } catch (Exception ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
}
