package spring.test.notice;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.awt.List;
import java.util.HashMap;
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

import spring.model.notice.NoticeDAO;
import spring.model.notice.NoticeDTO;

public class NoticeDAOTest extends NoticeDAO {

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
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao"); //DAO 타입 획득
		NoticeDTO dto = new NoticeDTO();

		dto.setContent("notice내용");
		dto.setTitle("notice제목");
		assertEquals(1, dao.create(dto));
	}

	@Test @Ignore
	public void testList() throws Exception {
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "제목");
		map.put("sno", 1);
		map.put("eno", 2);
		
		java.util.List list = dao.list(map);
		assertEquals(2, list.size());
	}

	@Test @Ignore
	public void testRead() throws Exception {
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao");
		NoticeDTO dto = (NoticeDTO) dao.read(1);
		
		assertEquals("제목",dto.getTitle());
		assertEquals("내용",dto.getContent());
	}
	

	@Test @Ignore  
	public void testUpdate() throws Exception {
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao");
		NoticeDTO dto = (NoticeDTO) dao.read(1);
		
		dto.setTitle("제목");
		dto.setContent("내용");
		
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao");
		assertEquals(0, dao.delete(3));
	}

	@Test @Ignore
	public void testTotal() throws Exception {
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao");
		
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		
		assertEquals(4, dao.total(map) );
	}

	@Test @Ignore //에러
	public void testViewCnt() throws Exception {
		NoticeDAO dao = (NoticeDAO) beans.getBean("noticedao");
		dao.viewCnt(1);
		NoticeDTO dto = (NoticeDTO) dao.read(1);
		assertEquals(1, dto.getViewCnt());
	}

}
