package com.nguyenbao.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nguyenbao.connection.MySQLConnection;
import com.nguyenbao.pojo.Jobs;

public class JobsService {
	
	public boolean addJobs(Jobs jobs) {
		Connection connection = MySQLConnection.getConnection();
		String sql = "insert into jobs(name,start_date,end_date) values (?,?,?)";
		boolean isSusses = false;
		try {			
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, jobs.getName());
			statement.setDate(2, (Date) jobs.getStart_date());
			statement.setDate(3, (Date) jobs.getEnd_date());
			int result = statement.executeUpdate();
			if(result>0) {
				isSusses = true;
			}else {
				isSusses = false;
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSusses;
	}
	
	public boolean updateJobs(Jobs jobs) {		
		Connection con = MySQLConnection.getConnection();
		String sql = "update jobs set name = ?,start_date= ?,end_date = ?"
				+ " WHERE id = ?"	;
		boolean isSuccess = false;
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setString(1, jobs.getName());
			statement.setDate(2, (Date) jobs.getStart_date());
			statement.setDate(3, (Date) jobs.getEnd_date());
			statement.setInt(4, jobs.getId());
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
	
	public void deleteJobs(int id) {
		Connection con = MySQLConnection.getConnection();
		String sql = "delete from jobs where id = ?";
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
	
	public Jobs getJobsById(int id){
		Jobs jobs = null;
		Connection connection = MySQLConnection.getConnection();
		String sql = "select * from jobs where id = ?";
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				jobs = new Jobs();
				jobs.setId(Integer.parseInt(resultSet.getString("id")));	
				jobs.setName(resultSet.getString("name"));
				jobs.setStart_date(resultSet.getDate("start_date"));
				jobs.setEnd_date(resultSet.getDate("end_date"));
			}
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return jobs;
	}
	
	public List<Jobs> getListJobs() {
		Jobs jobs = null;
		List<Jobs> list = new ArrayList<Jobs>();
		Connection connection = MySQLConnection.getConnection();
		String sql = "select * from jobs";		
		try {			
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				jobs = new Jobs();
				jobs.setId(Integer.parseInt(result.getString("id")));	
				jobs.setName(result.getString("name"));
				jobs.setStart_date(result.getDate("start_date"));
				jobs.setEnd_date(result.getDate("end_date"));
				list.add(jobs);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
