package spring.test.companyinfo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

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

import spring.model.companyinfo.CompanyInfoDAO;
import spring.model.companyinfo.CompanyInfoDTO;

public class CompanyInfoDAOTest extends CompanyInfoDAO {
	
	private static BeanFactory bean;

	

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("itclan.xml");
		bean = new XmlBeanFactory(resource);
				
		
		
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

	@Test //@Ignore
	public void testCreate() throws Exception {
		CompanyInfoDAO dao = (CompanyInfoDAO)bean.getBean("companyinfodao");
		CompanyInfoDTO dto = new CompanyInfoDTO();

       dto.setCompanyID("testman");
       dto.setCompanyName("test co");
       dto.setCompanyNumber(11111111);
       dto.setBossName("jonhycruger");
       dto.setCompanyScale("ser");
       dto.setCi("sulhyun.jpg");
       dto.setCategoryCode("A01");
       		
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
