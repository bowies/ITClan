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

	@Test //@Ignore
	public void testList() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		Map map = new HashMap();
		map.put("memberID", "aaa");
		List<LicenseDTO> list = dao.list(map);
		assertEquals(2, list.size());
	}

	@Test @Ignore
	public void testRead() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		int pk = 1;
		LicenseDTO dto = (LicenseDTO) dao.read(pk);
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		LicenseDTO dto = new LicenseDTO();
		dto.setQualification("정보처리산업기사");
		dto.setTakeDate("2016년07월11일");
		dto.setMemberID("bbb");
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		int pk = 1;
		LicenseDTO dto = (LicenseDTO) dao.read(pk);
		dto.setQualification("네트워크관리사");
		dto.setTakeDate("2015년07월20일");
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		dao.delete(4);
	}
	
	@Test @Ignore
	public void testDeleteinfo() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		dao.deleteinfo("bbb");
	}
	
	@Test @Ignore
	public void testTotal() throws Exception {
		LicenseDAO dao = (LicenseDAO)beans.getBean("licensedao");
		dao.total("aaa");
	}

}
