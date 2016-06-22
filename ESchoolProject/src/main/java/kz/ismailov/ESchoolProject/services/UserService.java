package kz.ismailov.ESchoolProject.services;

import java.util.List;

import kz.ismailov.ESchoolProject.model.User;

public interface UserService {
	public void addUser(User user);
	public User authenticate(String login, String password);
	public List<User>getAllUsers();
	public void deleteUser(Long id);
}
