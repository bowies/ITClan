package spring.test.externalactivity;

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

import spring.model.externalactivity.ExternalActivityDAO;
import spring.model.externalactivity.ExternalActivityDTO;

public class ExternalActivityDAOTest {
	

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
	public void testList() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		Map map = new HashMap();
		map.put("memberID", "bbb");
		List<ExternalActivityDTO> list = dao.list(map);
		assertEquals(1, list.size());
	}

	@Test @Ignore
	public void testRead() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		int pk = 3;
		ExternalActivityDTO dto = (ExternalActivityDTO) dao.read(pk);
		assertEquals("아르바이트", dto.getActSector());
	}

	@Test //@Ignore
	public void testCreate() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		ExternalActivityDTO dto = new ExternalActivityDTO();
		dto.setActPeriod("2015.09~2016.04");
		dto.setActSector("아르바이트");
		dto.setActContent("편의점");
		dto.setMemberID("ccc");
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		int pk = 4;
		ExternalActivityDTO dto = (ExternalActivityDTO) dao.read(pk);
		dto.setActPeriod("2015.09~2016.04");
		dto.setActSector("아르바이트");
		dto.setActContent("편의점");
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		dao.delete(3);
	}

	@Test @Ignore
	public void testDeleteinfo() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		dao.deleteinfo("aaa");
	}
	
	@Test @Ignore
	public void testTotal() throws Exception {
		ExternalActivityDAO dao = (ExternalActivityDAO)beans.getBean("externalactivitydao");
		dao.total("aaa");
	}
}
