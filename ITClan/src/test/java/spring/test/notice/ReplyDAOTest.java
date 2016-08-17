package spring.test.notice;

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

import spring.model.reply.ReplyDAO;
import spring.model.reply.ReplyDTO;

public class ReplyDAOTest {

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
		ReplyDAO dao = (ReplyDAO) beans.getBean("replydao");
		ReplyDTO dto = new ReplyDTO();
		dto.setNoticeNum(3);
		dto.setContent("댓글2");
		dto.setId("aaa");
		
		assertEquals(1, dao.create(dto));
	}
	

	@Test //@Ignore
	public void testList() throws Exception {
		ReplyDAO dao = (ReplyDAO) beans.getBean("replydao");
		Map map = new HashMap();
		map.put("noticeNum", 1);
		map.put("sno", 1);
		map.put("eno", 3);
		List<ReplyDTO> list = dao.list(map);
		assertEquals(list.size(),2 );
	}

	@Test @Ignore
	public void testRead() throws Exception {
		ReplyDAO dao = (ReplyDAO) beans.getBean("replydao");
		ReplyDTO dto = (ReplyDTO) dao.read(1);
		assertEquals(1, dto.getNoticeNum()); 
		assertEquals("의견1", dto.getContent());
		assertEquals("aaa", dto.getId());
	}

	@Test @Ignore
	public void testUpdate() throws Exception {
		ReplyDAO dao = (ReplyDAO) beans.getBean("replydao");
		ReplyDTO dto = new ReplyDTO();
		dto.setNoticeNum(1);
		dto.setContent("이러면안되는데로");
		dto.setId("aaa");
		dto.setReplyNum(1);
		assertEquals(1, dao.update(dto));
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		ReplyDAO dao = (ReplyDAO) beans.getBean("replydao");
		assertEquals(1, dao.delete(1));
	}

	@Test @Ignore
	public void testTotal() throws Exception {
		ReplyDAO dao = (ReplyDAO) beans.getBean("replydao");
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		assertEquals(2, dao.total(map));
	}

}
