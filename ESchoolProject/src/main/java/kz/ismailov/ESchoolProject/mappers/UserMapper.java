package kz.ismailov.ESchoolProject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Options.FlushCachePolicy;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kz.ismailov.ESchoolProject.model.User;

public interface UserMapper {
	
	@Insert("INSERT INTO users VALUES(NULL, #{login}, #{password}, #{name}, #{surname}, #{group}, 1)")
	@Options(useGeneratedKeys=true, keyProperty="id", flushCache=FlushCachePolicy.TRUE, keyColumn="id")
	public void addUser(User user);
	
	@Select("SELECT * FROM users WHERE login = #{login} AND password = #{password}")
	public User authenticate(@Param("login")String login, @Param("password")String password);
	
	@Select("SELECT * FROM users WHERE active=1")
	public List<User>getAllUsers();

}
