package com.wx.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.wx.pojo.User;
import com.wx.service.FriendService;
import com.wx.service.UserService;
import com.wx.util.WebUtils;
/**
 * �����û��������������
 * @author dxw
 *
 */
@RequestMapping("/user")
@Controller
public class UserController  {

	FriendService friendService =  (FriendService) WebUtils.getBean("friend");
	//����service�����
	@Autowired
	UserService userService;
	
	//��ѯ�û�����
	@RequestMapping("/selpwd")
	public void selUserPwd(@RequestParam("account")String account,HttpServletResponse resp){
		
		String pwd = userService.selUserPwdService(account);
		try {
			resp.getWriter().write(pwd);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}
	@RequestMapping("/updatepwd")
	//�޸��û�����
	public void updatePwd(@RequestParam("account")String account,@RequestParam("pwd")String pwd,HttpServletResponse resp) throws IOException {
		int index = userService.updataUserPwdService(account, pwd);
		if(index > 0){
			resp.getWriter().write("1");
			return;
		}
		
	}
	
	//�˳�
	@RequestMapping("/out")
	public String out(@RequestParam("account")String account,HttpSession session) throws IOException {
		//�˳�session����ʧЧ
		session.invalidate();
		userService.updatUserOnlineFlagService(account, "no");
		
		return "redirect:/login.jsp";
	}
	@RequestMapping("/updateuserinfo")
	//�޸��û���Ϣ
	public void updateUserInfo(User user) {
		userService.updateUserInfoService(user);
		
	}
	//�û�ע��
	@RequestMapping("/reg")
	public void checkReg(User user,HttpServletResponse response) throws IOException {
		int index = 0;	
		User u  = friendService.selUserService(user.getAccount());
		if( u == null){//�˺��Ѵ��ڲ��ܱ�ע��
			user.setOnline("no");
			index = userService.regService(user);
		}
		if(index>0){
			response.getWriter().write("1"); //1 ע��ɹ�
			return;
		}else{
			if(u == null){
				response.getWriter().write("0");//0 ����ע��ʧ�����
			}else{
				response.getWriter().write("2");//2 �˺��ѱ�ע��
			}
			return;
		}
	}
	@RequestMapping("/login")
	//У���¼
	public void checkLogin(@RequestParam("account")String account,@RequestParam("password")String password, HttpServletResponse resp,HttpSession session) throws IOException, ServletException {
		//����service�㷽��
		User u = userService.checkLoginService(account,password);
		
		if(null != u){//��¼�ɹ�
			userService.updatUserOnlineFlagService(account, "yes");//�޸ĵ�¼���
			session.setMaxInactiveInterval(3600);//����session��Чʱ�� 1Сʱ
			session.setAttribute("user", u);
			resp.getWriter().write("1");
			return;
		}else{//��¼ʧ��
			resp.getWriter().write("0");
			return;
		}
	}
}
