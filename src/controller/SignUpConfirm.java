package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TagDao;
import dao.UserDao;
import model.Tag;
import model.User;

/**
 * Servlet implementation class SignUpConfirm
 */
@WebServlet("/SignUpConfirm")
public class SignUpConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private TagDao tagDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpConfirm() {
        super();
        userDao = new UserDao();
        tagDao = new TagDao();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			signUpConfirm(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void signUpConfirm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
        String url="";
        User a =  (User)request.getSession().getAttribute("newuser");
        String code = request.getParameter("code");
        String maxn = request.getParameter("maxacnhan");
        if(code.equals(maxn))
        {
            url="/signup-success.jsp";
            userDao.saveUser(a);
            Tag defaultTag = new Tag(0, "Other", "#cccccc", a);
			tagDao.saveTag(defaultTag);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        else{
             url="/signup-confirm-fail.jsp";
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
	}
}
