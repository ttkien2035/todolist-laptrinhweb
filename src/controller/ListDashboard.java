package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import mail.MailAPINotify;
import model.Tag;
import model.Todo;
import model.User;

@WebServlet("/listDashboard")
public class ListDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = null;
    HttpSession session = null;

    public ListDashboard() {
        super();
        userDao = new UserDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession(true);
		try {
			listDashboard(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private void listDashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		
		User user = (User) session.getAttribute("user");
		String nowd = LocalDate.now().toString();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		List<Todo> listTodo = userDao.getTodosByUser(user.getId());
		List<Tag> listTag = userDao.getTagsByUser(user.getId());
		List<Todo> result=new ArrayList<Todo>();
		try {
			Date today = df.parse(nowd);
			for( int i=0; i< listTodo.size();i++) 
			{
				if (listTodo.get(i).getDate().compareTo(today)==0)
				{
					result.add(listTodo.get(i));
				}
			}
		} catch(Exception e) {
			
		}
		
		// Xử lý so sánh ngày trong todo với ngày hiện tại
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date now =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now1_str=dateFormat.format(now);
		Date now1 = now1 = sdf.parse(now1_str);
		now1 = sdf.parse(now1_str);
		System.out.println("Now1");
		System.out.println(now1);
	
		// Duyệt tất cả các todo để gửi thông báo
		if(listTodo!=null) {
			for(Todo todo: listTodo) {
				if((!todo.getDone()) && (todo.getDate().compareTo(now1)==0))
				{
					String description=""+todo.getTitle()+" "+todo.getDate().toString()+" deadline: "+todo.getDeadline().toString();
					
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(todo.getRemindat());
					Calendar calendar1 = Calendar.getInstance();
					calendar1.setTime(todo.getDate());
					calendar.set(calendar1.get(Calendar.YEAR), calendar1.get(Calendar.MONTH), calendar1.get(Calendar.DATE));

			        Date dateSchedule = calendar.getTime();

			        TimerTask timerTask = new TimerTask() {
			            @Override
			            public void run() {
			                System.out.println("GỞI MAIL");
			                String code = MailAPINotify.Send(user.getEmail(),description,user.getFullname());
			            }
			        };

			        Timer timer = new Timer();
			        timer.schedule(timerTask, dateSchedule);
				}
				
			}
		}
		
		
				

		session.setAttribute("listTodo", result); 
		session.setAttribute("listTag", listTag);
		session.setAttribute("listTodoTotal", listTodo);
		 

		RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
		dispatcher.forward(request, response);
	}

}
