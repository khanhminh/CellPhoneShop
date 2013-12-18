package cellphoneshop.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

public class JsonHandler {
	public static void writeJson(Object obj){
		Gson gson = new Gson();
		String json = gson.toJson(obj);		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.write(json);
			//writer.flush();
			writer.close();
		} catch (IOException e) {
			
		}
	}
}
