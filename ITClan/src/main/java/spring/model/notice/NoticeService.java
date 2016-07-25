package spring.model.notice;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.reply.ReplyDAO;
 
@Service 
public class NoticeService {
       @Autowired
        private NoticeDAO dao;
       @Autowired
        private ReplyDAO rdao;
 
      public void delete(int noticenum) throws Exception{
 
             rdao.delete(noticenum);
             dao.delete(noticenum);
      }
}