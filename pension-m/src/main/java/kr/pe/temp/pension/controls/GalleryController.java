package kr.pe.temp.pension.controls;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.pe.temp.pension.dao.GalleryDao;
import kr.pe.temp.pension.util.PagingUtils;
import kr.pe.temp.pension.util.UploadFileUtils;
import kr.pe.temp.pension.vo.Gallery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/Gallery")
public class GalleryController {
	
	GalleryDao galleryDao;
	
	@Resource(name="uploadFileUtils")
	UploadFileUtils uploadFileUtils;
	
	@Resource(name="pagingUtils")
	PagingUtils pagingUtils;
	
	@Autowired
	public GalleryController setGalleryDao(GalleryDao galleryDao) {
		this.galleryDao = galleryDao;
		return this;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Map<String, Object> paramMap, Map<String, Object> model) throws Exception {
		
		int totalCount = galleryDao.selectTotalCount();
		int currentPage = 1;
		if(paramMap.get("currentPage") != null) currentPage = Integer.valueOf(paramMap.get("currentPage").toString());
		int totalPage = pagingUtils.getTotalPage(totalCount);
		int beginIndex = pagingUtils.getBeginIndex(currentPage);
		int endIndex = pagingUtils.getEndIndex();
		
		paramMap.put("beginIndex", beginIndex);
		paramMap.put("endIndex", endIndex);
		
		List<Gallery> galList = galleryDao.selectList(paramMap);
		if(!galList.isEmpty())
			galList = uploadFileUtils.settingUploadImgPathForGalleryList(galList);
		model.put("totalCount", totalCount);
		model.put("currentPage", currentPage);
		model.put("totalPage", totalPage);
		model.put("galList", galList);
		return "list.jsp";
	}
	
	@RequestMapping(value="/listAjax", method=RequestMethod.POST)
	public String listAjax(@RequestBody Map<String, Object> paramMap, Map<String, Object> model) throws Exception {
		
		int totalCount = galleryDao.selectTotalCount();
		int currentPage = Integer.valueOf(paramMap.get("currentPage").toString());
		int totalPage = pagingUtils.getTotalPage(totalCount);
		int beginIndex = pagingUtils.getBeginIndex(currentPage+1);
		int endIndex = pagingUtils.getEndIndex();
		
		paramMap.put("beginIndex", beginIndex);
		paramMap.put("endIndex", endIndex);
		
		List<Gallery> galList = galleryDao.selectList(paramMap);
		if(!galList.isEmpty())
			galList = uploadFileUtils.settingUploadImgPathForGalleryList(galList);		
		model.put("totalCount", totalCount);
		model.put("currentPage", currentPage);
		model.put("totalPage", totalPage);
		model.put("galList", galList);	
		
		return "../galListAjaxResponse.jsp"; 
		
	}
	
	@RequestMapping(value="/oneAjax", method=RequestMethod.POST)
	public @ResponseBody Gallery one(@RequestBody Gallery gallery, Map<String, Object> model) throws Exception {
		galleryDao.updateCount(gallery.getNo());
		Gallery gal = galleryDao.selectOne(gallery.getNo());
		//gal.setUploadImgPath(uploadFileUtils.getUploadImgPath(gal.getUploadImg()));
		return gal; 
	}
	
}
