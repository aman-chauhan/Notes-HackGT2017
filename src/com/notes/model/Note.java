package com.notes.model;

public class Note {
	int NoteID;
	String NoteDate;
	String NoteTitle;
	String NoteContent;
	int NoteApproval;
	int CourseID;
	String CourseName;
	int StudentID;
	String FirstName;
	String LastName;

	public String getCourseName() {
		return CourseName;
	}

	public void setCourseName(String courseName) {
		CourseName = courseName;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public int getNoteID() {
		return NoteID;
	}

	public void setNoteID(int noteID) {
		NoteID = noteID;
	}

	public String getNoteDate() {
		return NoteDate;
	}

	public void setNoteDate(String noteDate) {
		NoteDate = noteDate;
	}

	public String getNoteTitle() {
		return NoteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		NoteTitle = noteTitle;
	}

	public String getNoteContent() {
		return NoteContent;
	}

	public void setNoteContent(String noteContent) {
		NoteContent = noteContent;
	}

	public int getNoteApproval() {
		return NoteApproval;
	}

	public void setNoteApproval(int noteApproval) {
		NoteApproval = noteApproval;
	}

	public int getCourseID() {
		return CourseID;
	}

	public void setCourseID(int courseID) {
		CourseID = courseID;
	}

	public int getStudentID() {
		return StudentID;
	}

	public void setStudentID(int studentID) {
		StudentID = studentID;
	}

}
