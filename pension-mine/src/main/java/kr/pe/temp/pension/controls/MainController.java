package kr.pe.temp.pension.controls;

import java.util.Map;

import kr.pe.temp.pension.dao.GalleryDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	GalleryDao galleryDao;
	
	@Autowired
	public MainController setGalleryDao(GalleryDao galleryDao) {
		this.galleryDao = galleryDao;
		return this;
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String goMain(Map<String, Object> paramMap, Map<String, Object> model) throws Exception {
		// gallery data
		// board data
		// reservation data
		// etc ..
		//List<Gallery> galList = galleryDao.selectList(paramMap);
		//model.put("galList", galList);
		return "main.jsp";
	}
	
}
