package kz.ismailov.ESchoolProject.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kz.ismailov.ESchoolProject.model.User;
import kz.ismailov.ESchoolProject.model.UserDelete;
import kz.ismailov.ESchoolProject.model.UserLogin;
import kz.ismailov.ESchoolProject.services.UserService;

@Controller
@SessionAttributes("user")
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login", "userLogin", new UserLogin());
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute("userLogin") UserLogin userLogin, Model model, HttpSession session) {
		String login = userLogin.getLogin();
		String password = userLogin.getPassword();
		User user = userService.authenticate(login, password);
		if(user!=null){
			model.addAttribute("user", user);
			session.setAttribute("user", user);
			return "redirect:profile.html";
		}else{
			return "login";
		}
	}
	
	@RequestMapping(value="/profile", method=RequestMethod.GET)
	public String profile(Model model, HttpSession session, ModelMap modelMap){
		if(session.getAttribute("user")!=null){
			List<User>users = new ArrayList<User>();
			users = userService.getAllUsers();
			model.addAttribute("users", users);
			UserDelete user_del = new UserDelete();
			model.addAttribute("user_del", user_del);
			User user = new User();
			model.addAttribute("new_user", user);
			return "profile";
		}else{
			return "redirect:index.jsp";
		}
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test(HttpSession session){
		if(session.getAttribute("user")!=null){
			return "test";
		}else{
			return "";
		}
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signup(Model model, HttpSession session) {
		if(session.getAttribute("user")!=null){
			User user = new User();
			model.addAttribute("new_user", user);
			return "signup";
		}else {
			return "redirect:login.html";
		}
		
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.setAttribute("user", null);
		return "redirect:login.html";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signup(@ModelAttribute("new_user") User user, Model model){
		userService.addUser(user);
		return "redirect:profile.html";
	}
	
	@RequestMapping(value="/delete_user", method=RequestMethod.POST)
	public String signup(@ModelAttribute("user_del") UserDelete userDel){
		Long id = userDel.getId();
		System.out.println("---Delete user, id="+id);
		userService.deleteUser(id);
		return "redirect:profile.html";
	}

}
