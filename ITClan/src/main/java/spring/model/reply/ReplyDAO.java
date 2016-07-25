package spring.model.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.itclan.DAOMyBatisInter;

public class ReplyDAO implements DAOMyBatisInter {

	private SqlSessionTemplate mybatis;
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("reply.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("reply.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("reply.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("reply.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("reply.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("reply.total", map);
	}

}
