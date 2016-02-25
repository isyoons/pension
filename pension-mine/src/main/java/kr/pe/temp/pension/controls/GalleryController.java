package kr.pe.temp.pension.controls;

import java.util.List;
import java.util.Map;

import kr.pe.temp.pension.dao.GalleryDao;
import kr.pe.temp.pension.vo.Gallery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value={"/Gallery","/TGallery"})
public class GalleryController {
	
	GalleryDao galleryDao;
	
	@Autowired
	public GalleryController setGalleryDao(GalleryDao galleryDao) {
		this.galleryDao = galleryDao;
		return this;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Map<String, Object> paramMap, Map<String, Object> model) throws Exception {
		List<Gallery> galList = galleryDao.selectList(paramMap);
		model.put("galList", galList);
		return "list.jsp";
	}
	
	@RequestMapping(value="/one", method=RequestMethod.POST)
	public String one(int no, Map<String, Object> model) throws Exception {
		Gallery gallery = galleryDao.selectOne(no);
		model.put("gal", gallery);
		return "ajaxResponse.jsp";
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(Gallery gallery) throws Exception {
		galleryDao.insert(gallery);
		return "redirect:list";
	}

	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String mod(Gallery gallery) throws Exception {
		galleryDao.update(gallery);
		return "redirect:list";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String del(int no) throws Exception {
		galleryDao.delete(no);
		return "redirect:list";
	}
	
}
