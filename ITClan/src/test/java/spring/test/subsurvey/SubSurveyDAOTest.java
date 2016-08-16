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
	public void testCreate() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = new SubSurveyDTO();
		dto.setPreNum(1);
		assertEquals(1, dao.createS(1));
	}

	@Test @Ignore
	public void testList() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testRead() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = (SubSurveyDTO) dao.read(1);
		assertEquals(0, dto.getAns1());
	}

	@Test @Ignore
	public void testUpdate1() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = (SubSurveyDTO) dao.read(1);
		assertEquals(1, dao.update1(1));
	}
	@Test @Ignore
	public void testUpdate2() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = (SubSurveyDTO) dao.read(1);
		assertEquals(1, dao.update2(1));
	}
	@Test @Ignore
	public void testUpdate3() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = (SubSurveyDTO) dao.read(1);
		assertEquals(1, dao.update3(1));
	}
	@Test @Ignore
	public void testUpdate4() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		SubSurveyDTO dto = (SubSurveyDTO) dao.read(1);
		assertEquals(1, dao.update4(1));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		SubSurveyDAO dao = (SubSurveyDAO)beans.getBean("subsurveydao");
		assertEquals(1, dao.delete(1));
	}
 
	@Test @Ignore
	public void testTotal() {
		fail("Not yet implemented");
	}

}
