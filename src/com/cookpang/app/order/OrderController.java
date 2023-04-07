package com.cookpang.app.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cookpang.app.Execute;
import com.cookpang.app.order.dao.OrderDAO;
import com.cookpang.app.user.dto.UserDTO;

public class OrderController implements Execute{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		OrderDAO orderDAO = new OrderDAO();
		int userNumber = (int) session.getAttribute("userNumber");
		
		System.out.println(userNumber);
//		주문고객
		// 로그인 연결되면 여기 지우고 위에 userNumber로 교체
		int number = userNumber ;
		
		
		UserDTO order = orderDAO.defaultOrderInfo(number);
		System.out.println(order);
		
		req.setAttribute("order", order);
		req.getRequestDispatcher("/app/payment.jsp").forward(req, resp);
	}
	
}
