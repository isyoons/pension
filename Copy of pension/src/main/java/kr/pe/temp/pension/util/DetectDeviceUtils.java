package kr.pe.temp.pension.util;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Component;

@Component("detectDeviceUtils")
public class DetectDeviceUtils {

	public String getDeviceType(Device device) {
		String uploadType = "w";
		if (device.isMobile()) {
			uploadType = "m";
        } else if (device.isTablet()) {
        	uploadType = "t";
        } else if (device.isNormal()) {
        	uploadType = "w";         
        } else {
        	uploadType = "m";
        }
		return uploadType;
	}
	
}
