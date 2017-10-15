package com.notes.template;

import java.io.File;
import java.net.URI;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.http.Header;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.sql.DataSource;
import java.util.Base64;

import org.springframework.jdbc.core.JdbcTemplate;

import com.notes.model.Note;

public class NoteJDBC {
	private DataSource ds;
	private JdbcTemplate jdbcTemplateObject;
	private static final String subscriptionKey = "021786cc5d4d45de91028b0a603002fd";
	private static final String uriBase = "https://westcentralus.api.cognitive.microsoft.com/vision/v1.0/recognizeText?handwriting=true";

	public void setDataSource(DataSource ds) {
		this.ds = ds;
		this.jdbcTemplateObject = new JdbcTemplate(this.ds);
	}

	public void createNote(String studentid, String courseid, String base64string) {
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
			int sid=Integer.parseInt(studentid);
			int cid=Integer.parseInt(courseid);
			String SQL = "insert into note (NoteDate, NoteTitle, NoteContent, CourseID, StudentID) values (NULL,NULL,?,?,?)";
			jdbcTemplateObject.update(SQL,s,cid,sid);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}
