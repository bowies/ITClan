package spring.test.offer;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

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

import spring.model.offer.OfferDAO;
import spring.model.offer.OfferDTO;

public class OfferDAOTest extends OfferDAO {
	
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
	public void testGetMybatis() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testSetMybatis() {
		fail("Not yet implemented");
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		OfferDTO dto = new OfferDTO();
		dto.setTitle("S/W 개발 및 시스템 운영 직원 채용");
		dto.setQualification("경력 최소 1년이상");
		dto.setOfferDate("2017-07-16");
		dto.setCompanyName("64");
		dto.setCompanyID("prettymk");
		dto.setDetail("1234");
		dto.setEmploymentSector("1234");
		dto.setTask("1234");
		dto.setWorkingArea("의왕");
		dto.setRecruitment("2명");
		dto.setSalary("연봉 2300만원 이상 ");
		assertEquals(1,dao.create(dto));
	}

	@Test @Ignore
	public void testList() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		Map map = new HashMap();
		map.put("offernum", 3);
		map.put("sno", 1);
		map.put("eno", 6);
		List<OfferDTO> list = dao.list(map);
		assertEquals(6,list.size());
	}
 
	@Test @Ignore
	public void testRead() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		OfferDTO dto = (OfferDTO)dao.read(7);
		
		assertEquals(7,dto.getOfferNum());
		assertEquals("S/W 개발 및 시스템 운영 직원 채용",dto.getTitle());
		assertEquals("2017-07-16 00:00:00.0",dto.getOfferDate());
		assertEquals("2명",dto.getRecruitment());
		assertEquals("연봉 2300만원 이상 ",dto.getSalary());
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		OfferDTO dto = new OfferDTO();
		dto.setOfferNum(5);
		dto.setTitle("S/W 개발 및 시스템 운영 직원 채용");
		dto.setQualification("경력 최소 1년이상");
		dto.setOfferDate("2016-08-16");
		dto.setCompanyName("test co");
		dto.setCompanyID("testman");
		dto.setDetail("차량 및 교통 관련 S/W개발 /App. 개발 /시스템 운영, 유지보수 (현대기술연구소 파견근무)");
		dto.setEmploymentSector("응용프로그래머");
		dto.setTask("1234");
		dto.setWorkingArea("의왕");
		dto.setRecruitment("3명");
		dto.setSalary("연봉 2500만원 이상");
		assertEquals(1,dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		assertEquals(1,dao.delete(5));
	}

	@Test //@Ignore
	public void testTotal() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		Map map = new HashMap();
		map.put("title", "개발");
		
		assertEquals(5,dao.total(map));
	}

	@Test @Ignore
	public void testIncreaseViewCnt() throws Exception {
		OfferDAO dao = (OfferDAO) beans.getBean("offerdao");
		dao.increaseViewCnt(5);
		OfferDTO dto = (OfferDTO) dao.read(5);
		assertEquals(5, dto.getViewCnt());
	}
}
