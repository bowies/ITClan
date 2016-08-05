package spring.test.survey;

import static org.junit.Assert.*;

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

import spring.model.survey.SurveyDAO;
import spring.model.survey.SurveyDTO;

public class SurveyDAOTest {
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
	public void testCreate() throws Exception {
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		SurveyDTO dto = new SurveyDTO();
		dto.setTitle("화요일은좋아");
		dto.setEnddate("2016-08-11");
		
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
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

}
