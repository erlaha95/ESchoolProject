package kz.ismailov.ESchoolProject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import kz.ismailov.ESchoolProject.model.User;
import kz.ismailov.ESchoolProject.services.UserService;

@Test
@ContextConfiguration(locations = { "classpath*:spring-test-config.xml" })
public class TestNGSpring extends AbstractTestNGSpringContextTests{
	
	@Autowired
	UserService userService;
	
	@Test
	void testUserService() {
		System.out.println("hello test");
		User user = userService.authenticate("admin", "123");
		System.out.println(user);
		Assert.assertNotNull(user);
		Assert.assertEquals(user.getName(), "Yerlan");

	}
	

}
