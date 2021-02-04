package controller.todo;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import dao.UserDao;
import model.Tag;
import model.Todo;
import model.User;

/**
 * Servlet implementation class SortTodo
 */
@WebServlet("/sortTodo")
public class SortTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = null;
	FilterTodo filterTodo=null;
    HttpSession session = null;
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortTodo() {
        super();
        userDao = new UserDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		session = request.getSession(true);
		
		sortTodo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void sortTodo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Set response content type
        response.setContentType("text/html");
 
        PrintWriter out = response.getWriter();
        String title = "Reading All Form Parameters";
        String docType = "<!doctype html public \"-//w3c//dtd html 4.0 "
                + "transitional//en\">\n";
 
        out.println(docType +
            "<html>\n" +
            "<head><title>" + title + "</title></head>\n" +
            "<body bgcolor = \"#f0f0f0\">\n" +
            "<h1 align = \"center\">" + title + "</h1>\n" +
            "<table width = \"100%\" border = \"1\" align = \"center\">\n" +
            "<tr bgcolor = \"#949494\">\n" +
                "<th>Param Name</th>" +
                "<th>Param Value(s)</th>\n"+
            "</tr>\n"
        );
 
        // get all parameters of form
        Enumeration paramNames = request.getParameterNames();
 
        // read parameters
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();
            out.print("<tr><td>" + paramName + "</td>\n<td>");
            String[] paramValues = request.getParameterValues(paramName);
 
            // Read single valued data
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() == 0)
                    out.println("<i>No Value</i>");
                else
                    out.println(paramValue);
            } else {
                // Read multiple valued data
                out.println("<ul>");
 
                for (int i = 0; i < paramValues.length; i++) {
                    out.println("<li>" + paramValues[i]);
                }
                out.println("</ul>");
            }
       }
       out.println("</tr>\n</table>\n</body></html>");
    }

}
