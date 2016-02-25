package kr.pe.temp.pension.controls;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { "/reservation" })
public class ReservationController {

	@RequestMapping(value = "/guide/guide.temp", method = RequestMethod.GET)
	public String guide() throws Exception {

		return "guide.jsp";
	}
	
	@RequestMapping(value = "/realtime/status_reservation.temp", method = RequestMethod.GET)
	public String realtime() throws Exception {

		return "status_reservation.jsp";
	}
}
