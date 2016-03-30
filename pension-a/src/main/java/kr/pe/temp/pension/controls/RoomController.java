package kr.pe.temp.pension.controls;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
//@SessionAttributes ?��?��
@Controller
@SessionAttributes("rooms")
public class RoomController {
	

	/*@Autowired
	public LogInController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}*/

	@RequestMapping(value = "/rooms/rooms.temp", method = RequestMethod.GET)
	public String roomform(String roomno,Map<String,Object> model) throws Exception {
		model.put("roomnumber", roomno);
		return "/rooms/rooms.jsp";
	}
}
