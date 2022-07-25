package com.nguyenbao.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nguyenbao.connection.MySQLConnection;
import com.nguyenbao.model.JoinTasks;
import com.nguyenbao.pojo.Tasks;

public class TaskService {
	
	public List<JoinTasks> getListTask() {
		JoinTasks tasks = null;
		List<JoinTasks> list = new ArrayList<JoinTasks>();
		Connection connection =MySQLConnection.getConnection();
		String sql = "select t.id, t.taskname, j.name, u.fullname, j.start_date, j.end_date \r\n"
				+ "from tasks t \r\n"
				+ "join users u on t.user_id = u.id \r\n"
				+ "join jobs j on t.job_id = j.id \r\n";		
		try {			
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet result = statement.executeQuery();
			while(result.next()) {
				tasks = new JoinTasks();
				tasks.setId(Integer.parseInt(result.getString("id")));
				tasks.setTaskname(result.getString("taskname"));
				tasks.setName(result.getString("name"));
				tasks.setFullname(result.getString("fullname"));
				tasks.setStart_date(result.getDate("start_date"));
				tasks.setEnd_date(result.getDate("end_date"));
				list.add(tasks);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteTask(int id) {
		Connection con = MySQLConnection.getConnection();
		String sql = "delete from tasks where id = ?";
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
	
	public boolean addTask(Tasks task) {
		Connection connection =MySQLConnection.getConnection();
		String sql = "INSERT INTO tasks(taskname, user_id, job_id)\r\n"
				+ "VALUES (?,?,?)";
		boolean isSusses = false;
		try {			
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, task.getTaskname());
			statement.setInt(2, task.getUser_id());
			statement.setInt(3, task.getJob_id());
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
	
	public boolean updateTask(Tasks tasks) {
		Connection connection = MySQLConnection.getConnection();
		String sql = "update tasks set taskname = ?, user_id = ?, job_id = ?"
				+ " WHERE id = ?" ;
		boolean isSuccess = false;
		try {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, tasks.getTaskname());
			statement.setInt(2, tasks.getUser_id());
			statement.setInt(3, tasks.getJob_id());
			statement.setInt(4, tasks.getId());
			int result = statement.executeUpdate();
			if(result > 0 ) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}			
			connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isSuccess;
	}
	//list updateTask by User and Job
//	public List<UpdateTask> getListUpdateTasks() {
//		UpdateTask updateTask = null;
//		List<UpdateTask> list = new ArrayList<UpdateTask>();
//		Connection connection =MySQLConnection.getConnection();
//		String sql = "select t.id, t.taskname, t.user_id, u.fullname, t.job_id, j.name \r\n"
//				+ "from tasks t \r\n"
//				+ "join users u on t.user_id = u.id \r\n"
//				+ "join jobs j on t.job_id = j.id \r\n";		
//		try {			
//			PreparedStatement statement = connection.prepareStatement(sql);
//			ResultSet result = statement.executeQuery();
//			while(result.next()) {
//				updateTask = new UpdateTask();
//				updateTask.setId(Integer.parseInt(result.getString("id")));
//				updateTask.setTaskname(result.getString("taskname"));
//				updateTask.setUser_id(Integer.parseInt(result.getString("user_id")));
//				updateTask.setFullname(result.getString("fullname"));
//				updateTask.setJob_id(Integer.parseInt(result.getString("job_id")));
//				updateTask.setName(result.getString("name"));
//				list.add(updateTask);
//			}
//			connection.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
}
