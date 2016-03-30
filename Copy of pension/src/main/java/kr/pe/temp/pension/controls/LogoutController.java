package kr.pe.temp.pension.controls;

import kr.pe.temp.pension.dao.TMemberDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@SessionAttributes("tmember")
@Controller
@RequestMapping(value="/Temp")
public class LogoutController {
	
	TMemberDao tMemberDao;
	
	@Autowired
	public LogoutController setTmemberDao(TMemberDao tMemberDao) {
		this.tMemberDao = tMemberDao;
		return this;
	}
	
	@RequestMapping(value="/logout.temp")
	public String logout(SessionStatus status) throws Exception {
		status.setComplete();
		return "redirect:/";
	}	
	
}
