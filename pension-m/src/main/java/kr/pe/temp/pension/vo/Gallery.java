package kr.pe.temp.pension.vo;

import java.util.Date;

public class Gallery {
	
	private int no;
	private String title;
	private String contents;
	private Date uploadDate;
	private String uploadImg;
	private String uploadType;
	private int clickCount;
	private String uploadImgPath;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getUploadImg() {
		return uploadImg;
	}
	public void setUploadImg(String uploadImg) {
		this.uploadImg = uploadImg;
	}
	public String getUploadType() {
		return uploadType;
	}
	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}
	public int getClickCount() {
		return clickCount;
	}
	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}
	public String getUploadImgPath() {
		return uploadImgPath;
	}
	public void setUploadImgPath(String uploadImgPath) {
		this.uploadImgPath = uploadImgPath;
	}
	@Override
	public String toString() {
		return String
				.format("Gallery [no=%s, title=%s, contents=%s, uploadDate=%s, uploadImg=%s, uploadType=%s, clickCount=%s, uploadImgPath=%s]",
						no, title, contents, uploadDate, uploadImg, uploadType,
						clickCount, uploadImgPath);
	}

	
}
