package com.notes.template;

import java.net.URI;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.http.Header;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.sql.DataSource;
import java.util.Base64;

import org.springframework.jdbc.core.JdbcTemplate;


public class NoteJDBC {
	private DataSource ds;
	private JdbcTemplate jdbcTemplateObject;
	private static final String subscriptionKey = "3825e23344844b36935be01dfb5a9196";
	private static final String uriBase = "https://westcentralus.api.cognitive.microsoft.com/vision/v1.0/recognizeText?handwriting=true";

	public void setDataSource(DataSource ds) {
		this.ds = ds;
		this.jdbcTemplateObject = new JdbcTemplate(this.ds);
	}

	public void createNote(int studentid, String courseid, String base64string) {
		HttpClient textClient = new DefaultHttpClient();
		HttpClient resultClient = new DefaultHttpClient();

		try {
			URI uri = new URI(uriBase);
			HttpPost textRequest = new HttpPost(uri);
			textRequest.setHeader("Content-Type", "application/octet-stream");
			textRequest.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);
			byte[] decoded = Base64.getDecoder().decode(base64string);
			ByteArrayEntity requestEntity = new ByteArrayEntity(decoded,
					ContentType.create("application/octet-stream"));
			textRequest.setEntity(requestEntity);
			HttpResponse textResponse = textClient.execute(textRequest);
			if (textResponse.getStatusLine().getStatusCode() != 202) {
				HttpEntity entity = textResponse.getEntity();
				String jsonString = EntityUtils.toString(entity);
				JSONObject json = new JSONObject(jsonString);
				System.out.println("Error:\n");
				System.out.println(json.toString(2));
				return;
			}
			String operationLocation = null;
			Header[] responseHeaders = textResponse.getAllHeaders();
			for (Header header : responseHeaders) {
				if (header.getName().equals("Operation-Location")) {
					operationLocation = header.getValue();
					break;
				}
			}
			Thread.sleep(10000);
			HttpGet resultRequest = new HttpGet(operationLocation);
			resultRequest.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);

			HttpResponse resultResponse = resultClient.execute(resultRequest);
			HttpEntity responseEntity = resultResponse.getEntity();
			String s = "";
			if (responseEntity != null) {
				String jsonString = EntityUtils.toString(responseEntity);
				JSONObject json = new JSONObject(jsonString);
				JSONObject results = (JSONObject) json.get("recognitionResult");
				JSONArray lines = (JSONArray) results.get("lines");
				for (int i = 0; i < lines.length(); i++) {
					s = s + ((JSONObject) lines.get(i)).get("text") + "\n";
				}
			}
			System.out.println(s);
			int cid = Integer.parseInt(courseid);
			String SQL = "insert into note (NoteDate, NoteTitle, NoteContent, CourseID, StudentID) values (NULL,NULL,?,?,?)";
			jdbcTemplateObject.update(SQL, s, cid, studentid);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

	public int editNote(int student_id, String noteid, String noteTitle, String noteDate, String courseID,
			String noteContent) {
		String SQL = "update note set NoteDate='" + noteDate + "', NoteTitle='" + noteTitle + "', NoteContent='"
				+ noteContent + "', CourseID=" + courseID + " where StudentID=" + Integer.toString(student_id)
				+ " and NoteID=" + noteid;
		return jdbcTemplateObject.update(SQL);

	}

	public int submitNote(int student_id, String noteid, String noteTitle, String noteDate, String noteContent) {
		String SQL = "update note set NoteDate='" + noteDate + "', NoteTitle='" + noteTitle + "', NoteContent='"
				+ noteContent + "', NoteApproval=1 where StudentID=" + Integer.toString(student_id) + " and NoteID="
				+ noteid;
		return jdbcTemplateObject.update(SQL);
	}

	public int deleteNote(int student_id, String noteid) {
		String SQL = "delete from note where StudentID=" + Integer.toString(student_id) + " and NoteID=" + noteid;
		return jdbcTemplateObject.update(SQL);
	}

	public int likeNote(int student_id, String noteid) {
		String SQL = "insert into likes (StudentID,NoteID) values (" + Integer.toString(student_id) + "," + noteid
				+ ")";
		return jdbcTemplateObject.update(SQL);
	}

	public int likeCount(int noteID) {
		String SQL = "SELECT count(StudentID) as likecount FROM notes.likes WHERE NoteID=" + Integer.toString(noteID);
		return jdbcTemplateObject.queryForObject(SQL, Integer.class).intValue();
	}

	public int isliked(int noteID, int studentid) {
		String SQL = "SELECT count(StudentID) as likecount FROM notes.likes WHERE NoteID=" + Integer.toString(noteID)
				+ " and StudentID=" + Integer.toString(studentid);
		return jdbcTemplateObject.queryForObject(SQL, Integer.class).intValue();
	}

	public int dislikeNote(int student_id, String noteid) {
		String SQL = "delete from likes where StudentID=" + Integer.toString(student_id) + " and NoteID=" + noteid;
		return jdbcTemplateObject.update(SQL);
	}

}
