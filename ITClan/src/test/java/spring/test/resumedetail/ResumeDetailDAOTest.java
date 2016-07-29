package spring.test.resumedetail;

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

import spring.model.resumedetail.ResumeDetailDAO;
import spring.model.resumedetail.ResumeDetailDTO;

public class ResumeDetailDAOTest {

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
		ResumeDetailDAO dao = (ResumeDetailDAO)beans.getBean("resumedetaildao");
		Map map = new HashMap();
		map.put("memberID", "bbb");
		map.put("sno", 1);
		map.put("eno", 5);
		List<ResumeDetailDTO> list = dao.list(map );
		assertEquals(3, list.size());
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		ResumeDetailDAO dao = (ResumeDetailDAO)beans.getBean("resumedetaildao");
		ResumeDetailDTO dto = new ResumeDetailDTO();
		dto.setMemberID("aaa");
		dto.setBiograph("자소서.hwp");
		dto.setPortfolio("포트.hwp");
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		ResumeDetailDAO dao = (ResumeDetailDAO)beans.getBean("resumedetaildao");
		dao.delete(4);
	}
	
	@Test @Ignore
	public void testDeleteinfo() throws Exception {
		ResumeDetailDAO dao = (ResumeDetailDAO)beans.getBean("resumedetaildao");
		dao.delete("aaa");
	}
	
	@Test //@Ignore
	public void testTotal() throws Exception {
		ResumeDetailDAO dao = (ResumeDetailDAO)beans.getBean("resumedetaildao");
		dao.total("aaa");
	}

}
