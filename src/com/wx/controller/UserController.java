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
 * 处理用户操作自身的请求
 * @author dxw
 *
 */
@RequestMapping("/user")
@Controller
public class UserController  {

	FriendService friendService =  (FriendService) WebUtils.getBean("friend");
	//创建service层对象
	@Autowired
	UserService userService;
	
	//查询用户密码
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
	//修改用户密码
	public void updatePwd(@RequestParam("account")String account,@RequestParam("pwd")String pwd,HttpServletResponse resp) throws IOException {
		int index = userService.updataUserPwdService(account, pwd);
		if(index > 0){
			resp.getWriter().write("1");
			return;
		}
		
	}
	
	//退出
	@RequestMapping("/out")
	public String out(@RequestParam("account")String account,HttpSession session) throws IOException {
		//退出session设置失效
		session.invalidate();
		userService.updatUserOnlineFlagService(account, "no");
		
		return "redirect:/login.jsp";
	}
	@RequestMapping("/updateuserinfo")
	//修改用户信息
	public void updateUserInfo(User user) {
		userService.updateUserInfoService(user);
		
	}
	//用户注册
	@RequestMapping("/reg")
	public void checkReg(User user,HttpServletResponse response) throws IOException {
		int index = 0;	
		User u  = friendService.selUserService(user.getAccount());
		if( u == null){//账号已存在不能被注册
			user.setOnline("no");
			index = userService.regService(user);
		}
		if(index>0){
			response.getWriter().write("1"); //1 注册成功
			return;
		}else{
			if(u == null){
				response.getWriter().write("0");//0 其他注册失败情况
			}else{
				response.getWriter().write("2");//2 账号已被注册
			}
			return;
		}
	}
	@RequestMapping("/login")
	//校验登录
	public void checkLogin(@RequestParam("account")String account,@RequestParam("password")String password, HttpServletResponse resp,HttpSession session) throws IOException, ServletException {
		//调用service层方法
		User u = userService.checkLoginService(account,password);
		
		if(null != u){//登录成功
			userService.updatUserOnlineFlagService(account, "yes");//修改登录标记
			session.setMaxInactiveInterval(3600);//设置session有效时间 1小时
			session.setAttribute("user", u);
			resp.getWriter().write("1");
			return;
		}else{//登录失败
			resp.getWriter().write("0");
			return;
		}
	}
}
