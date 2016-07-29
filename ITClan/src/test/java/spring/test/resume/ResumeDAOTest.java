package spring.test.resume;

import static org.junit.Assert.assertEquals;

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

import spring.model.resume.ResumeDAO;
import spring.model.resume.ResumeDTO;

public class ResumeDAOTest {

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
		ResumeDAO dao = (ResumeDAO)beans.getBean("resumedao");
		Map map = new HashMap();
		map.put("memberID", "bbb");
		List<ResumeDTO> list = dao.list(map );
		assertEquals(2, list.size());
	}

	@Test //@Ignore
	public void testCreate() throws Exception {
		ResumeDAO dao = (ResumeDAO)beans.getBean("resumedao");
		ResumeDTO dto = new ResumeDTO();
		dto.setMemberID("aaa");
		dto.setResumeName("자기소개서.hwp");
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		ResumeDAO dao = (ResumeDAO)beans.getBean("resumedao");
		dao.delete(1);
	}
	
	@Test @Ignore
	public void testDeleteinfo() throws Exception {
		ResumeDAO dao = (ResumeDAO)beans.getBean("resumedao");
		dao.delete("aaa");
	}
	
	@Test //@Ignore
	public void testTotal() throws Exception {
		ResumeDAO dao = (ResumeDAO)beans.getBean("resumedao");
		dao.total("aaa");
	}

}
