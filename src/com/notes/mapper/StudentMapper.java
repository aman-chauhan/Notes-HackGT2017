package com.notes.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notes.model.Student;

public class StudentMapper implements RowMapper<Student> {

	@Override
	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		Student student=new Student();
		student.setStudent_id(rs.getInt("StudentID"));
		student.setFirst_name(rs.getString("FirstName"));
		student.setLast_name(rs.getString("LastName"));
		student.setEmail(rs.getString("Email"));
		student.setPassword(rs.getString("Password"));
		return student;
	}

}
