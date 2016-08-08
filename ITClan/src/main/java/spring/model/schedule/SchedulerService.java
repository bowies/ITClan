package spring.model.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhtmlx.planner.DHXEv;

@Service
public class SchedulerService {
	
	@Autowired
	private SchedulerDAO eventManagerdao;

	public Iterable<DHXEv> getEvent() throws Exception {
		return eventManagerdao.list();
	}

	public void updateEvent(SchedulerDTO schedule) throws Exception {
		eventManagerdao.update(schedule);
	}

	public int insertEvent(SchedulerDTO schedule) throws Exception {
		return eventManagerdao.create(schedule);
	}

	public void deleteEvent(Integer id) throws Exception {
		eventManagerdao.delete(id);
	}
}