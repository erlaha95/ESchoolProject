package kz.ismailov.ESchoolProject.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kz.ismailov.ESchoolProject.mappers.UserMapper;
import kz.ismailov.ESchoolProject.model.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;
	
	@Transactional
	public void addUser(User user) {
		userMapper.addUser(user);
	}
	
	public User authenticate(String login, String password) {
		User user = userMapper.authenticate(login, password);
		return user;
	}
	
	public List<User> getAllUsers() {
		List<User>users = userMapper.getAllUsers();
		return users;
	}

}
