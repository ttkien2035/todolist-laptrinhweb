package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TagDao;
import dao.TodoDao;
import dao.UserDao;
import model.Tag;
import model.Todo;
import model.User;
import utils.RestFB;


@WebServlet("/LoginFacebook")
public class LoginFacebook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private TodoDao todoDao;
	private TagDao tagDao;
	HttpSession session = null;

    public LoginFacebook() {
        super();
        userDao = new UserDao();
		todoDao = new TodoDao();
		tagDao = new TagDao();
		System.out.println("user servlet");
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			loginFacebook(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void loginFacebook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String code = request.getParameter("code");
		
	    if (code == null || code.isEmpty()) {
	      RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
	      dis.forward(request, response);
	    }
	    else {
	      String accessToken = RestFB.getToken(code);
	      com.restfb.types.User user = RestFB.getUserInfo(accessToken);
	      try
	      {
	    	  User newUser = new User(user.getId(),user.getName(),user.getId());	      
	    	  userDao.saveUser(newUser);   
	    	  session.setAttribute("user", newUser);
	    	  List<Todo> listTodo =userDao.getTodosByUser(newUser.getId());
	    	  List<Tag> listTag = userDao.getTagsByUser(newUser.getId());
	    	  request.setAttribute("listTodo", listTodo);
	    	  request.setAttribute("listTag", listTag);
	      }
	      catch(Exception e)
	      {
	    	  User oldUser = userDao.EmailExist(user.getId());
	    	  session.setAttribute("user", user);
	    	  List<Todo> listTodo =userDao.getTodosByUser(oldUser.getId());
	    	  List<Tag> listTag = userDao.getTagsByUser(oldUser.getId());
	    	  request.setAttribute("listTodo", listTodo);
	    	  request.setAttribute("listTag", listTag);
	      }
	      
	      RequestDispatcher dis = request.getRequestDispatcher("todolist.jsp");
	      dis.forward(request, response);
	    }		
	}

}
