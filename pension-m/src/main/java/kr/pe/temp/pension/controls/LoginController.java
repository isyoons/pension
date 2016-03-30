package kr.pe.temp.pension.controls;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.pe.temp.pension.dao.TMemberDao;
import kr.pe.temp.pension.vo.TMember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("tmember")
@Controller
@RequestMapping(value={"/Temp","/App", "/Temp/TPw"})
public class LoginController {
	
	TMemberDao tMemberDao;
	
	@Autowired
	public LoginController setTmemberDao(TMemberDao tMemberDao) {
		this.tMemberDao = tMemberDao;
		return this;
	}
	
	@RequestMapping(value="/loginForm.temp", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest request) throws Exception {
		return "tLogin.jsp";
	}
	
	@RequestMapping(value="/loginValidAjax.temp", method=RequestMethod.POST)
	public @ResponseBody String loginValidAjax(@RequestBody TMember member, HttpServletRequest request) throws Exception {
		int result = tMemberDao.exist(member);
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("login", member);
		}
		return String.valueOf(result);
	}

	@RequestMapping(value="/mLogin.temp", method=RequestMethod.POST)
	public String mLoginAjax(@RequestBody TMember member, Map<String, Object> model, HttpServletRequest request) throws Exception {
		int result = tMemberDao.exist(member);
		if(result > 0) {
			model.put("re", "ok");
			HttpSession session = request.getSession();
			session.setAttribute("login", member);

		} else {
			model.put("re", "no");
		}
		return "mLoginAjaxResponse.jsp";
	}

	@RequestMapping(value="/infoForm.temp", method=RequestMethod.GET)
	public String infoForm(HttpServletRequest request) throws Exception {
		return "info.jsp";
	}
	
	@RequestMapping(value="/updateValidAjax.temp", method=RequestMethod.POST)
	public @ResponseBody String updateInfo(@RequestBody TMember member, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		TMember login = (TMember)session.getAttribute("login");
		if(member.getPassword().equalsIgnoreCase(login.getPassword())) {
			int result = tMemberDao.update(member);
			return String.valueOf(result);
		}
		return "pw";
	}

	@RequestMapping(value="/updatePwValidAjax.temp", method=RequestMethod.POST)
	public @ResponseBody String updatePwInfo(@RequestBody TMember member, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		TMember login = (TMember)session.getAttribute("login");
		if(member.getPassword().equalsIgnoreCase(login.getPassword())) {
			int result = tMemberDao.updatePw(member.getPassword1());
			return String.valueOf(result);
		}
		return "pw";
	}	
}
