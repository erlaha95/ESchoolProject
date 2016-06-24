package kz.ismailov.ESchoolProject.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Options.FlushCachePolicy;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kz.ismailov.ESchoolProject.model.User;

public interface UserMapper {
	
	@Insert("INSERT INTO users VALUES(NULL, #{login}, #{password}, #{name}, #{surname}, #{group}, 1, 0)")
	@Options(useGeneratedKeys=true, keyProperty="id", flushCache=FlushCachePolicy.TRUE, keyColumn="id")
	public void addUser(User user);
	
	@Select("SELECT * FROM users WHERE login = #{login} AND password = #{password} AND role=1")
	public User authenticate(@Param("login")String login, @Param("password")String password);
	
	@Select("SELECT * FROM users WHERE active=1 AND role!=1")
	public List<User>getAllUsers();
	
	@Update("UPDATE users SET active=0 WHERE id=#{id}")
	public void deleteUser(Long id);

}
