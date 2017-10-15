package com.notes.template;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.notes.mapper.CourseMapper;
import com.notes.mapper.StudentMapper;
import com.notes.model.Course;
import com.notes.model.Student;

public class CourseJDBC {

	private DataSource ds;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource ds) {
		this.ds = ds;
		this.jdbcTemplateObject = new JdbcTemplate(this.ds);
	}
	
	public List<Course> listOfCoursesOfStudent(int studentid) {
		
		String SQL = "select CourseID,CourseName from course C,studentfollowscourse SFC where C.CourseID = SFC.CourseID and SFC.StudentID = "+Integer.toString(studentid);
		List<Course> courselist = jdbcTemplateObject.query(SQL, new CourseMapper());
		return courselist;
	}
}
