package controller.todo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.Tag;
import model.Todo;
import model.User;

/**
 * Servlet implementation class ListTodoThisMonth
 */
@WebServlet("/listTodoThisMonth")
public class ListTodoThisMonth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = null;
    HttpSession session = null;
    public ListTodoThisMonth() {
        super();
        userDao = new UserDao();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
		
		listTodoThisMonth(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	private void listTodoThisMonth(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User) session.getAttribute("user");
		String now= LocalDate.now().toString();
		String[] parts = now.split("-");
		String part0 = parts[0]; 
		String part1 = parts[1]; 
		String part2 = parts[2]; 
		List<Todo> listTodo = userDao.getTodosByUser(user.getId());
		List<Tag> listTag = userDao.getTagsByUser(user.getId());
		List<Todo> result=new ArrayList<Todo>();
		// Get calendar, clear it and set week number and year.
		Calendar calendar = Calendar.getInstance();
		calendar.clear();
		calendar.set(Calendar.MONTH, Integer.parseInt(part1)-1);
		calendar.set(Calendar.YEAR,Integer.parseInt(part0));
		// Now get the first day of week.
		Date datestart = calendar.getTime();
		//Kiểm tra tháng để tìm ngày cuối tháng
		if (Integer.parseInt(part1)==2)
			{
				if((Integer.parseInt(part0)%400==0||(Integer.parseInt(part0)%4==0&&Integer.parseInt(part0)%100!=0)))//năm nhuận
					calendar.add(Calendar.DAY_OF_MONTH,28);
				else
					calendar.add(Calendar.DAY_OF_MONTH,27);
			}
			else if(Integer.parseInt(part1)==1||Integer.parseInt(part1)==3||Integer.parseInt(part1)==5||Integer.parseInt(part1)==7||Integer.parseInt(part1)==8||Integer.parseInt(part1)==10||Integer.parseInt(part1)==12)
			{
				System.out.println("tháng"+Integer.parseInt(part1));
				calendar.add(Calendar.DAY_OF_MONTH,30);
				System.out.println("tháng 31");
				System.out.println("tháng lẽ đã cộng!");
			}
			else if(Integer.parseInt(part1)==4||Integer.parseInt(part1)==6||Integer.parseInt(part1)==9||Integer.parseInt(part1)==11)
			{
				System.out.println("tháng"+Integer.parseInt(part1));
				calendar.add(Calendar.DAY_OF_MONTH,29);
			}
			Date dateend = calendar.getTime();
			for( int i=0; i< listTodo.size();i++) 
			{
				if (listTodo.get(i).getDate().compareTo(datestart)>=0&&listTodo.get(i).getDate().compareTo(dateend)<=0)
					result.add(listTodo.get(i));
			}
		session.setAttribute("listTodo", result); 
		session.setAttribute("listTag", listTag);
		session.setAttribute("listTodoTotal", listTodo);
		 

		RequestDispatcher dispatcher = request.getRequestDispatcher("todomonth.jsp");
		dispatcher.forward(request, response);
	}
}
