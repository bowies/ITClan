package spring.test.resumeinfo;

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

import spring.model.resumeinfo.ResumeInfoDAO;
import spring.model.resumeinfo.ResumeInfoDTO;

public class ResumeInfoDAOTest {
	
	private static BeanFactory beans;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("kbc.xml");
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

	@Test  @Ignore
	public void testRead() {
		ResumeInfoDAO dao = (ResumeInfoDAO)beans.getBean("resumeinfodao");
		String memberID = "aaa";
		ResumeInfoDTO dto = dao.read(memberID);
	}

	@Test //@Ignore
	public void testCreate() {
		ResumeInfoDAO dao = (ResumeInfoDAO)beans.getBean("resumeinfodao");
		ResumeInfoDTO dto = new ResumeInfoDTO();
		dto.setMemberID("ccc");
		dto.setEducation("고등학교 졸업");
		dto.setCareer("신입");
		dto.setEmploymentType("정규직");
		dto.setExSalary(3500);
		dto.setDisableGrade("비장애");
		dto.setPicture("img.jpg");
		dto.setExArea("서울 종로");
		dto.setExField("웹개발자");
		dto.setMilitary("군필");
		assertEquals(1, dao.create(dto));
	}
	
	@Test //@Ignore
	public void testUpdate() {
		ResumeInfoDAO dao = (ResumeInfoDAO)beans.getBean("resumeinfodao");
		
		ResumeInfoDTO dto = new ResumeInfoDTO();
		
		dto.setMemberID("aaa");
		dto.setEducation("고등학교 졸업");
		dto.setCareer("신입");
		dto.setEmploymentType("정규직");
		dto.setExSalary(3500);
		dto.setDisableGrade("비장애");
		dto.setPicture("img.jpg");
		dto.setExArea("서울 종로");
		dto.setExField("웹개발자");
		dto.setMilitary("군필");
		assertEquals(1, dao.update(dto));
	}

	@Test //@Ignore
	public void testDelete() {
		ResumeInfoDAO dao = (ResumeInfoDAO)beans.getBean("resumeinfodao");
		assertEquals(1, dao.delete("ccc"));
	}

}
