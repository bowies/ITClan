package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
@Component
public class NoticeDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override                                                                        
	public int create(Object dto) throws Exception {
		return mybatis.insert("notice.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("notice.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		int noticenum = (Integer)pk;
		return mybatis.selectOne("notice.read", noticenum);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("notice.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		int noticenum = (Integer)pk;
		return mybatis.delete("notice.delete", noticenum);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("notice.total", map);
	}

	public int viewCnt(int noticenum) {
		return mybatis.update("notice.viewcnt",noticenum);
		
	}

}
