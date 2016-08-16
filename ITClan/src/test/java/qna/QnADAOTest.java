package qna;

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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.qna.QnADAO;
import spring.model.qna.QnADTO;

public class QnADAOTest {

	private static BeanFactory beans;
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}   

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

	@After @Ignore
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testTotal() {
		QnADAO dao = (QnADAO) beans.getBean("qnadao");
		Map map = new HashMap();
		map.put("col","title");
		map.put("word", "3");
		try {
//			assertEquals(1,dao.total("title"));
			assertEquals(2, dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	@Test @Ignore
	public void testList() throws Exception {
		QnADAO dao = (QnADAO) beans.getBean("qnadao");
		Map map = new HashMap();
		map.put("col",	"content");
		map.put("word",	"내");
		map.put("sno",	1);
		map.put("eno",	5);
		List<QnADTO> list = dao.list(map);
		assertEquals(5,list.size());
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		QnADAO dao = (QnADAO) beans.getBean("qnadao");
		assertEquals(1,dao.delete(1));
	}



	@Test @Ignore
	public void testUpdate() {
		QnADAO dao = (QnADAO) beans.getBean("qnadao");
		QnADTO dto = new QnADTO();
		dto.setQnANum(1);
		dto.setContent("내용수정");
		dto.setTitle("제목수정");
		
	}

	@Test //@Ignore
	public void testRead() throws Exception {
		QnADAO dao = (QnADAO) beans.getBean("qnadao");
//		QnADTO dto = dao.read(2, mybatis);
		
		QnADTO dto = (QnADTO)dao.read(1);
		assertEquals("제목2", dto.getTitle());
		assertEquals("내용2", dto.getContent());
		assertEquals("작성자1", dto.getName());
	}
	
	@Test @Ignore
	public void testCreate() throws Exception {
		QnADAO dao = (QnADAO) beans.getBean("qnadao");
		QnADTO dto = new QnADTO();
//		dto.setQnANum(4);
		dto.setTitle("제목4");
		dto.setContent("내용4");
		dto.setName("이름4");
		assertEquals(1, dao.create(dto));
	}





}
