package spring.test.companymember;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;
import java.util.HashMap;
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

import spring.model.companymember.CompanyMemberDAO;
import spring.model.companymember.CompanyMemberDTO;

public class CompanyMemberDAOTest {

	private static BeanFactory bean;

	@Autowired
	private SqlSessionTemplate mybatis;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("itclan.xml");
		bean = new XmlBeanFactory(resource);
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

	@Test
	@Ignore
	public void testGetMybatis() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testSetMybatis() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testCreate() throws Exception {
		CompanyMemberDAO dao = (CompanyMemberDAO) bean.getBean("companymemberdao");
		CompanyMemberDTO dto = new CompanyMemberDTO();

		dto.setCompanyID("testman");
		dto.setName("testboy");
		dto.setPasswd("test");
		dto.setPhone("0101111111");
		dto.setEmail("test@test.com");
		dto.setCompanyNumber(11111111);
		dto.setCompanyName("test co");

		assertEquals(1, dao.create(dto));
	}

	@Test
	@Ignore
	public void testList() throws Exception {
		CompanyMemberDAO dao = (CompanyMemberDAO) bean.getBean("companymemberdao");
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);

		List<CompanyMemberDTO> list = dao.list(map);
		assertEquals(7, list.size());

	}

	@Test
	@Ignore
	public void testRead() throws Exception {
		CompanyMemberDAO dao = (CompanyMemberDAO) bean.getBean("companymemberdao");
		CompanyMemberDTO dto = (CompanyMemberDTO) dao.read("testman");

		assertEquals("testman", dto.getCompanyID());
		assertEquals("testboy", dto.getName());
		assertEquals("test", dto.getPasswd());
		assertEquals("0101111111", dto.getPhone());
		assertEquals("test@test.com", dto.getEmail());
		assertEquals(11111111, dto.getCompanyNumber());
		assertEquals("test co", dto.getCompanyName());
	}

	@Test
	@Ignore
	public void testUpdate() throws Exception {

		CompanyMemberDAO dao = (CompanyMemberDAO) bean.getBean("companymemberdao");
		CompanyMemberDTO dto = new CompanyMemberDTO();

		dto.setCompanyID("testman");
		dto.setName("testboy2");
		dto.setPasswd("test2");
		dto.setPhone("0101111111");
		dto.setEmail("test2@test.com");
		dto.setCompanyNumber(11111111);
		dto.setCompanyName("test co2");

		assertEquals(1, dao.update(dto));
	}

	@Test
	@Ignore
	public void testDelete() throws Exception {
		CompanyMemberDAO dao = (CompanyMemberDAO) bean.getBean("companymemberdao");
		assertEquals(1, dao.delete("testman"));
	}

	@Test
	@Ignore
	public void testTotal() throws Exception {
		CompanyMemberDAO dao = (CompanyMemberDAO) bean.getBean("companymemberdao");
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		assertEquals(7, dao.total(map));
	}

}
