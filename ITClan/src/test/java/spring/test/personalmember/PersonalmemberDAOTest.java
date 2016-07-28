package spring.test.personalmember;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.personalmember.PersonalMemberDAO;
import spring.model.personalmember.PersonalMemberDTO;

public class PersonalmemberDAOTest {
	
	private static BeanFactory beans;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("itclan.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before 
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testGetGrade() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals("P", dao.getGrade("bbb"));
	}
	@Test @Ignore
	public void testLoginCheck() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals(1, dao.loginCheck("bbb", "1234"));
	}
	@Test @Ignore
	public void testDelete() throws Exception {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals(1, dao.delete("usesr1"));
	}
	@Test @Ignore
	public void testpwFind() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals("1234", dao.pwFind("ccc", "member3@email.com"));
	}
	@Test @Ignore
	public void testidFind() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals("ccc", dao.idFind("하롱이", "member3@email.com"));
	}
	@Test @Ignore
	public void testEmailCheck() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals(1, dao.EmailCheck("member3@email.com"));
	}
	@Test @Ignore
	public void testidCheck() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals(1, dao.idCheck("ccc"));
	}
	@Test @Ignore
	public void testPasswdCheck() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals(1, dao.passwdCheck("ccc", "1234"));
	}

	@Test @Ignore
	public void testUpdatePw() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		assertEquals(1, dao.updatePw("asdf1111", "usesr1"));
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		PersonalMemberDTO dto = (PersonalMemberDTO)dao.read("usesr1");
		dto.setName("glgl");
		dto.setPhone("01011119999");
		dto.setAddress("서울");
		dto.setAddress2("종로구");
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testCreate() throws Exception{
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		PersonalMemberDTO dto = new PersonalMemberDTO();
		
		dto.setMemberID("usesr1");
		dto.setName("하룽이");
		dto.setBirth("900101");
		dto.setPasswd("user1111");
		dto.setPhone("01011112222");
		dto.setEmail("user9@mail.net");
		dto.setAddress("인천광역시");
		dto.setAddress2("부평구");
		assertEquals(1,dao.create(dto));
	}

	@Test @Ignore
	public void testRead() throws Exception {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		PersonalMemberDTO dto = (PersonalMemberDTO) dao.read("usesr1");
		assertEquals("하룽이", dto.getName());
		assertEquals("인천광역시", dto.getAddress());
		assertEquals("부평구", dto.getAddress2());
	}

	@Test @Ignore
	public void testList() throws Exception {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 3);
		List<PersonalMemberDTO> list = dao.list(map);
		assertEquals(3, list.size());
	}

	@Test @Ignore
	public void testTotal() {
		PersonalMemberDAO dao = (PersonalMemberDAO)beans.getBean("personalmemberdao");
		Map map = new HashMap();
		map.put("col","name");
		map.put("word", "");
		try {
			assertEquals(4, dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
