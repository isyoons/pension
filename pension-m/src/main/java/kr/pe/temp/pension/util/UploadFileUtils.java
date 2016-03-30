package kr.pe.temp.pension.util;

import java.io.File;
import java.util.List;
import java.util.UUID;

import kr.pe.temp.pension.vo.Gallery;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("uploadFileUtils")
public class UploadFileUtils {

	private String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
	
	private String getFileExt(String fileName) {
		return fileName.toLowerCase().substring(fileName.lastIndexOf("."));
	} 

	private String makeDir() throws Exception {
		String rootPath = System.getProperty("catalina.home"); // for tomcat;
		File dir = new File(rootPath + File.separator + "webapps/pension/uploadFiles");
		if(!dir.exists()) {
			dir.mkdirs();
		}
		return dir.getAbsolutePath();
	}
	
	public String saveUploadFile(MultipartFile file) throws Exception {
		String dir = makeDir();
		String fileName = getRandomString() + getFileExt(file.getOriginalFilename());
		File saveFile = new File(dir + File.separator + fileName);
		file.transferTo(saveFile);
		return fileName;
	}

	public String getUploadImgPath(String fileName) throws Exception {
		return makeDir() + File.separator + fileName;
	}
	
	public List<Gallery> settingUploadImgPathForGalleryList(List<Gallery> galList) throws Exception {
		for(Gallery gal : galList) {
			gal.setUploadImgPath(getUploadImgPath(gal.getUploadImg()));
		}
		return galList;
	}

	public String saveUploadFileForApp(MultipartFile file) throws Exception {
		String dir = makeDir();
		String fileName = getRandomString() + ".jpg";
		File saveFile = new File(dir + File.separator + fileName);
		file.transferTo(saveFile);
		return fileName;
	}
}
