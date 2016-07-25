package spring.model.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
	public class ReplyDAO2 {

		@Autowired
		private SqlSessionTemplate sqlSessionTemplate;
		
		public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
		}
		
		public int replynum(int noticenum){
			return sqlSessionTemplate.selectOne("reply.replynum", noticenum);
		}

		public boolean create(ReplyDTO dto) {
			boolean flag = false;
			int cnt = sqlSessionTemplate.insert("reply.create", dto);
			if (cnt > 0)
				flag = true;

			return flag;
		}

		public ReplyDTO read(int replynum) {

			return (ReplyDTO) sqlSessionTemplate.selectOne("reply.read", replynum);

		}

		public boolean update(ReplyDTO dto) {
			boolean flag = false;

			int cnt = sqlSessionTemplate.update("reply.update", dto);
			if (cnt > 0)
				flag = true;

			return flag;
		}

		public List<ReplyDTO> list(Map map) {

			return sqlSessionTemplate.selectList("reply.list", map);
		}

		public int total(int noticenum) {
			return (Integer) sqlSessionTemplate.selectOne("reply.total", noticenum);
		}

		public boolean delete(int rnum) {
			boolean flag = false;
			int cnt = sqlSessionTemplate.delete("reply.delete", rnum);
			if (cnt > 0)
				flag = true;

			return flag;
		}

}
