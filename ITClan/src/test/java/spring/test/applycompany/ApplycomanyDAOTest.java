package spring.test.applycompany;

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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.applycompany.ApplyCompanyDAO;
import spring.model.applycompany.ApplyCompanyDTO;
import spring.model.externalactivity.ExternalActivityDTO;
import spring.model.license.LicenseDTO;
import spring.model.offer.OfferDTO;
import spring.model.portfolio.PortFolioDTO;
import spring.model.resume.ResumeDTO;

public class ApplycomanyDAOTest {
	
	
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
	public void testCreate()throws Exception {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		ApplyCompanyDTO dto = new ApplyCompanyDTO();
		dto.setMemberID("bbb");
		dto.setOfferNum(1);
		assertEquals(1, dao.create(dto));
	 
	}

	@Test @Ignore
	public void testRead() throws Exception {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		Object pk = 3;
		OfferDTO dto = (OfferDTO)dao.read(pk);
		
		
		assertEquals("보안솔루션 엔지니어 신입/경력 모집", dto.getTitle());
		assertEquals("학력무관 경력무관", dto.getQualification());
		
	}

	@Test @Ignore
	public void testTotal() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		assertEquals(1, dao.total_personal("ccc"));
	}

	@Test @Ignore
	public void testList() throws Exception {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		Map map = new HashMap();
		map.put("memberID", "ccc");
		map.put("sno", 1);
		map.put("eno", 3);
		List<ApplyCompanyDTO> list = dao.list(map);
		assertEquals(1, list.size());
	}

	@Test @Ignore
	public void testDelete() throws Exception{
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		assertEquals( 1, dao.delete("aaa"));
		
	}


	@Test @Ignore
	public void testTotal_company() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		assertEquals(2, dao.total_company(3));
	}

	@Test @Ignore
	public void testList_company() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		Map map = new HashMap();
		map.put("offerNum", 3);
		map.put("sno", 1);
		map.put("eno", 5);
		List<ApplyCompanyDTO> list = dao.list_company(map);
		
		assertEquals(2, list.size());
	}

	@Test @Ignore
	public void testList_D() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		String dto = dao.list_D("bbb", 2);
		
		assertEquals("자소서.hwp",dto );
	}
	@Test //@Ignore
	public void testList_P() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		String dto = dao.list_P("bbb", 4);
		
		assertEquals("포트폴리오.hwp",dto );
	}

	@Test @Ignore
	public void testList_L() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		List<LicenseDTO> list = dao.list_L("bbb");
		assertEquals(1, list.size());
	}

	@Test @Ignore
	public void testList_A() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		List<ExternalActivityDTO> list= dao.list_A("bbb");
		
		assertEquals(1, list.size());
	}
	@Test @Ignore
	public void testDelete_company() {
		ApplyCompanyDAO dao = (ApplyCompanyDAO)beans.getBean("applycompanydao");
		assertEquals(1, dao.delete_company(1));
		
		
	}

}
