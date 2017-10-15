package com.notes.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notes.model.Course;

public class CourseMapper implements RowMapper<Course>{

	@Override
	public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course course=new Course();
		course.setCourse_id(rs.getInt("CourseID"));
		course.setCourse_name(rs.getString("CourseName"));
		return course;
	}

}
