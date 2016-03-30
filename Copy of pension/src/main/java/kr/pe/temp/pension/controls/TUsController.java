package kr.pe.temp.pension.controls;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Temp/TUs")
public class TUsController {
	
	@RequestMapping(value="/introduce.temp", method=RequestMethod.GET)
	public String introduce() throws Exception {
		return "introduce.jsp";
	}
	
	@RequestMapping(value="/contactus.temp", method=RequestMethod.GET)
	public String contactus() throws Exception {
		return "contactus.jsp";
	}
	
}
