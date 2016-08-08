package spring.model.schedule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;


@Component
public class SchedulerDAO  {

	@Autowired
	private SqlSessionTemplate mybatis; 
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
   
	public int create(Object vo) throws Exception {
		SchedulerDTO svo = (SchedulerDTO) vo;
		return mybatis.insert("scheduler.insertEvent",svo);
	}

	public  Iterable<DHXEv> list() throws Exception {
		DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
      	List evs = new ArrayList();
      		
		    List<SchedulerDTO> resultset = mybatis.selectList("scheduler.getEvent");
		    
		    for(int i = 0; i < resultset.size(); i++){
		      	DHXEvent e = new DHXEvent();
		      	e.setId(resultset.get(i).getEvent_id());
		          e.setText(resultset.get(i).getEvent_name());
		          e.getText();
		          e.setStart_date(resultset.get(i).getStart_date());
		          e.setEnd_date(resultset.get(i).getEnd_date());
		      	evs.add(e);
		    }
      	DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";
		return evs;
	}
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("scheduler.getEvent", pk);
	}

	public int update(Object vo) throws Exception {
		SchedulerDTO svo = (SchedulerDTO) vo;
		return mybatis.update("scheduler.updateEvent", svo);
	}

	public int delete(Object pk) throws Exception {
		int id = (Integer) pk;
		return mybatis.delete("scheduler.deleteEvent", id);
	}


}
