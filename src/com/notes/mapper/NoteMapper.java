package com.notes.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.notes.model.Note;

public class NoteMapper implements RowMapper<Note> {
	@Override
	public Note mapRow(ResultSet rs, int rowNum) throws SQLException {
		Note note = new Note();
		note.setNoteID(rs.getInt("NoteID"));
		note.setNoteDate(rs.getString("NoteDate"));
		if (rs.wasNull()) {
			note.setNoteDate("Date Not Set");
		}
		note.setNoteTitle(rs.getString("NoteTitle"));
		if (rs.wasNull()) {
			note.setNoteTitle("Title Not Set");
		}
		note.setNoteContent(rs.getString("NoteContent"));
		note.setNoteApproval(rs.getInt("NoteApproval"));
		note.setCourseID(rs.getInt("CourseID"));
		note.setStudentID(rs.getInt("StudentID"));
		note.setFirstName(rs.getString("FirstName"));
		note.setLastName(rs.getString("LastName"));
		note.setCourseName(rs.getString("CourseName"));
		return note;
	}

}
