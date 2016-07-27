package onebyone;

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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import spring.model.onebyone.OneByOneDAO;
import spring.model.onebyone.OneByOneDTO;

public class OneByOneDAOTest {
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

	@After
	public void tearDown() throws Exception {
	}

	@Test @Ignore
	public void testSetMybatis() {
		fail("Not yet implemented");
	}

	@Test //@Ignore
	public void testIncreaseViewcnt() throws Exception {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		dao.increaseViewcnt(4);
		
		OneByOneDTO dto = (OneByOneDTO) dao.read(4);
		assertEquals(1,dto.getViewcnt());
		
	}

	
	//오류 - 수정필
	@Test @Ignore
	public void testAddAnsnum() {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		dao.addAnsnum(7, 1);
		OneByOneDTO dto = dao.readReply(8);  //자식글
		assertEquals(2,dto.getAnsnum()); //1에서 증가되면 2니까 예상값은 2
	}

	@Test @Ignore
	public void testReadReply() {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		OneByOneDTO dto = dao.readReply(4);  //답변을 위해 부모글을 읽어옴
		assertEquals(0,dto.getIndent());
		assertEquals(0,dto.getAnsnum());
		assertEquals(4,dto.getGrpno());
		assertEquals("제목4",dto.getTitle());
	}
	
	
	
	@Test @Ignore
	public void testUpdate() throws Exception {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		OneByOneDTO dto = new OneByOneDTO();
		dto.setOneByOneNum(2);
		dto.setContent("내용수정");
		dto.setTitle("제목수정");
	}

	@Test @Ignore
	public void testDelete() throws Exception {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		assertEquals(1,dao.delete(1));
	}

	@Test @Ignore
	public void testTotal() {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		Map map = new HashMap();
		map.put("col","title");
		map.put("word", "제");
		try {
//			assertEquals(1,dao.total("title"));
			assertEquals(5, dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Test @Ignore
	public void testList() throws Exception {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		Map map = new HashMap();
		map.put("col",	"content");
		map.put("word",	"내");
		map.put("sno",	1);
		map.put("eno",	5);
		List<OneByOneDTO> list = dao.list(map);
		assertEquals(5,list.size());
		
	}

	
	@Test @Ignore
	public void testRead() throws Exception {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		
		OneByOneDTO dto = (OneByOneDTO)dao.read(1);
		assertEquals("제목", dto.getTitle());
		assertEquals("내용", dto.getContent());
		assertEquals("id001@mail.com", dto.getMail());
		assertEquals("f.txt", dto.getFilename());
		assertEquals("id001", dto.getId());
//		assertEquals("", dto.getName());
		
		
	}

	@Test @Ignore
	public void testCreate() throws Exception {
		OneByOneDAO dao = (OneByOneDAO) beans.getBean("onebyonedao");
		OneByOneDTO dto = new OneByOneDTO();
//		dto.setQnANum(4);
		dto.setTitle("제목4");
		dto.setContent("내용4");
		dto.setFilename("k.txt");
		dto.setMail("test@mail.com");
		dto.setName("테스터");
		dto.setId("k@mail.com");
		dto.setGrpno(0);
		assertEquals(1, dao.create(dto));
		
		
	}
}
