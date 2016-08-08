package spring.test.survey;

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

	@Test @Ignore
	public void testCreate() throws Exception {
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		SurveyDTO dto = new SurveyDTO();
		dto.setTitle("화요일은좋아");
		dto.setContent1("one");
		dto.setContent2("two");
		dto.setContent3("three");
		dto.setContent4("four");
		dto.setEnddate("2016-08-11");
		
		assertEquals(1, dao.create(dto));

	}

	@Test @Ignore
	public void testList() throws Exception {
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<SurveyDTO> list = dao.list(map);
		 
		assertEquals(1, list.size());
		
	}

	@Test @Ignore
	public void testRead() throws Exception {
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		SurveyDTO dto = (SurveyDTO) dao.read(1);
		
		assertEquals("화요일은좋아", dto.getTitle());
	}

	
	@Test @Ignore
	public void testDelete() throws Exception {
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		
		assertEquals(1, dao.delete(1));
	}

	@Test @Ignore
	public void testTotal() throws Exception {
		SurveyDAO dao = (SurveyDAO)beans.getBean("surveydao");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		
		
		assertEquals(1, dao.total(map));
	}

}
