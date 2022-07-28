package com.nguyenbao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nguyenbao.connection.MySQLConnection;
import com.nguyenbao.pojo.Users;

public class UserService {
	
	public Users getUsers(String email, String password) {
		Users users = null;
		
		Connection con = MySQLConnection.getConnection();
		String sql = "select * from users where email = ? and password = ?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				users = new Users();
				users.setEmail(result.getString("email"));
				
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}
	
	//lấy xem thông tin user bằng id
	public Users getUserById(int id) {
		Users user = null;
		Connection con = MySQLConnection.getConnection();
		String sql = "select * from users where id = ?";		
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				user = new Users();
				user.setId(Integer.parseInt(result.getString("id")));	
				user.setFullname(result.getString("fullname"));
				user.setEmail(result.getString("email"));	
				user.setAddress(result.getString("address"));
				user.setPhone(Integer.parseInt(result.getString("phone")));
			}
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return user;
	}
	//lấy listuser
	public List<Users> getListUser() {
		Users user = null;
		List<Users> list = new ArrayList<Users>();
		Connection con = MySQLConnection.getConnection();
		String sql = "select * from users";		
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				user = new Users();
				user.setId(Integer.parseInt(result.getString("id")));	
				user.setFullname(result.getString("fullname"));
				user.setEmail(result.getString("email"));
				user.setPhone(Integer.parseInt(result.getString("phone")));
				user.setAddress(result.getString("address"));
				list.add(user);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}
	//add user
	public boolean addUser(Users user) {		
		Connection con = MySQLConnection.getConnection();
		String sql = "insert into users(fullname, email, password, phone, address) values (?,?,?,?,?)";
		boolean isSuccess = false;
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, user.getFullname());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setInt(4, user.getPhone());
			statement.setString(5, user.getAddress());
			int result = statement.executeUpdate();
			if(result > 0 ) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}			
			con.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return isSuccess;
	}
	//delete user
	public void deleteUser(int id) {		
		Connection con = MySQLConnection.getConnection();
		String sql = "delete from users where id = ?";
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, id);			
			int result = statement.executeUpdate();
			con.close();			
			if(result > 0) {
				System.out.println("Success!");
			}else {
				System.out.println("Error!");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//update user
	public boolean updateUser(Users user) {		
		Connection con = MySQLConnection.getConnection();
		String sql = "update users set fullname = ?,email= ?,phone= ?,address = ?"
				+ " WHERE id = ?"	;
		boolean isSuccess = false;
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, user.getFullname());
			statement.setString(2, user.getEmail());
			statement.setInt(3, user.getPhone());
			statement.setString(4, user.getAddress());
			statement.setLong(5, user.getId());
			int result = statement.executeUpdate();
			if(result > 0 ) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}			
			con.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return isSuccess;
	}
}
