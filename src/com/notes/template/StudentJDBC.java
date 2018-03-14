package com.notes.template;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.notes.mapper.NoteMapper;
import com.notes.mapper.StudentMapper;
import com.notes.mapper.StudentSafeMapper;
import com.notes.model.Note;
import com.notes.model.Student;

public class StudentJDBC {
	private DataSource ds;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource ds) {
		this.ds = ds;
		this.jdbcTemplateObject = new JdbcTemplate(this.ds);
	}

	public void insert(Student student) {
		String SQL = "insert into student (FirstName, LastName, Email, Password) values (?,?,?,?)";
		jdbcTemplateObject.update(SQL, student.getFirst_name(), student.getLast_name(), student.getEmail(),
				student.getPassword());
	}

	public Student getStudentbyLogin(String email, String password) {
		String SQL = "select * from student where Email = ? and Password = ?";
		try {
			Student student = jdbcTemplateObject.queryForObject(SQL, new StudentMapper(), email, password);
			return student;
		} catch (Exception e) {
			return null;
		}
	}

	public List<Student> listOfStudentsIFollow(int studentid) {
		String SQL = "select S.StudentID,S.FirstName,S.LastName,S.Email from student S, studentfollowsstudent SFS where SFS.StudentID2=S.StudentID and SFS.StudentID1 = "
				+ Integer.toString(studentid);
		List<Student> studentlist = jdbcTemplateObject.query(SQL, new StudentSafeMapper());
		return studentlist;
	}

	public List<Student> listOfStudentsWhoFollowMe(int studentid) {
		String SQL = "select S.StudentID,S.FirstName,S.LastName,S.Email from student S, studentfollowsstudent SFS where SFS.StudentID1=S.StudentID and SFS.StudentID2 = "
				+ Integer.toString(studentid);
		List<Student> studentlist = jdbcTemplateObject.query(SQL, new StudentSafeMapper());
		return studentlist;
	}

	public List<Note> listOfNotesByMe(int studentid, int approval) {
		String SQL = "select * from note N, course C, student S where N.CourseID=C.CourseID and N.StudentID=S.StudentID and N.StudentID = "
				+ studentid + " and N.NoteApproval=" + approval + " order by NoteDate DESC";
		List<Note> notelist = jdbcTemplateObject.query(SQL, new NoteMapper());
		return notelist;
	}

	public List<Note> listOfNotesFromCoursesILike(int studentid) {
		String SQL = "select * from note N, course C, student S where N.CourseID=C.CourseID and N.StudentID=S.StudentID and N.NoteApproval = 1 and N.CourseID in (select distinct SFC.CourseID from studentfollowscourse SFC where SFC.StudentID = "
				+ studentid + ") order by NoteDate DESC";
		List<Note> notelist = jdbcTemplateObject.query(SQL, new NoteMapper());
		return notelist;
	}

	public List<Note> listOfNotesFromStudentsIFollow(int studentid) {
		String SQL = "select * from note N, course C, student S where N.CourseID=C.CourseID and N.StudentID=S.StudentID and N.NoteApproval = 1 and N.StudentID in (select distinct SFS.StudentID2 from studentfollowsstudent SFS where SFS.StudentID1 = "
				+ studentid + ") order by NoteDate DESC";
		List<Note> notelist = jdbcTemplateObject.query(SQL, new NoteMapper());
		return notelist;
	}
}
