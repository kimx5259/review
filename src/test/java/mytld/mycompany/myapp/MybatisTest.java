package mytld.mycompany.myapp;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MybatisTest {
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	
	@Test
	public void testFactory() {
		System.out.println(sqlFactory);
	}
	
	
	@Test
	public void testSqlSession() {
		SqlSession session = null;
		
		try {
			session = sqlFactory.openSession();
			System.out.println(session);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}
	
	
	
	
	
	
	
	
	
}
