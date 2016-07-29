package spring.test.portfolio;

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

import spring.model.portfolio.PortFolioDAO;
import spring.model.portfolio.PortFolioDTO;

public class PortFolioDAOTest {

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
		PortFolioDAO dao = (PortFolioDAO)beans.getBean("portfoliodao");
		Map map = new HashMap();
		map.put("memberID", "bbb");
		List<PortFolioDTO> list = dao.list(map );
		assertEquals(2, list.size());
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		PortFolioDAO dao = (PortFolioDAO)beans.getBean("portfoliodao");
		PortFolioDTO dto = new PortFolioDTO();
		dto.setMemberID("aaa");
		dto.setPortfolioName("포트폴리오.hwp");;
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		PortFolioDAO dao = (PortFolioDAO)beans.getBean("portfoliodao");
		dao.delete(1);
	}
	
	@Test @Ignore
	public void testDeleteinfo() throws Exception {
		PortFolioDAO dao = (PortFolioDAO)beans.getBean("portfoliodao");
		dao.delete("aaa");
	}
	
	@Test //@Ignore
	public void testTotal() throws Exception {
		PortFolioDAO dao = (PortFolioDAO)beans.getBean("portfoliodao");
		dao.total("aaa");
	}

}
