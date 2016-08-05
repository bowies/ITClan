package spring.test.subsurvey;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.subsurvey.SubSurveyDAO;
import spring.model.subsurvey.SubSurveyDTO;

public class SubSurveyDAOTest {
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
	public void testRead_sub() {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		List dto = dao.read_sub(2);
		
		assertEquals(1, dto.size());
		
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = new SubSurveyDTO();
		dto.setContent("1.a");
		dto.setPreNum(2);
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testList() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testRead() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = (SubSurveyDTO) dao.read(3);
		dto.setContent("haru");
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		assertEquals(1, dao.delete(2));
	}
 
	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

}
