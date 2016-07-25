package spring.test.license;

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
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.license.LicenseDAO;
import spring.model.license.LicenseDTO;

public class LicenseDAOTest {

	@Autowired
	private static BeanFactory beans;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("kbc.xml");
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

	@Test //@Ignore
	public void testList() {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		Map map = new HashMap();
		map.put("memberID", "aaa");
		map.put("sno", 1);
		map.put("eno", 5);
		List<LicenseDTO> list = dao.list(map);
		assertEquals(2, list.size());
	}

	@Test //@Ignore
	public void testRead() {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		int licenseNum = 1;
		String memberID = "aaa";
		LicenseDTO dto = dao.read(licenseNum, memberID);
	}

	@Test //@Ignore
	public void testCreate() {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		LicenseDTO dto = new LicenseDTO();
		dto.setQualification("정보처리산업기사");
		dto.setTakeDate("2016년07월11일");
		dto.setMemberID("bbb");
		assertEquals(1, dao.create(dto));
	}

	@Test //@Ignore
	public void testUpdate() {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		int licenseNum = 1;
		String memberID = "aaa";
		LicenseDTO dto = dao.read(licenseNum, memberID);
		dto.setQualification("네트워크관리사");
		dto.setTakeDate("2015년07월20일");
		assertEquals(1, dao.update(dto));
	}

	@Test //@Ignore
	public void testDelete() {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		dao.delete(4, "bbb");
	}

}
