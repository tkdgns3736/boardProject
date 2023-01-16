package com.webjjang.board.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	private int no;
	private String title, content, writer;
	private Date writeDate;
	private int hit;
	private String start_date;
	private String end_date;
	private String file_name;
	private MultipartFile uploadFile;
	private String popup_date;
	

	public String getPopup_date() {
		return popup_date;
	}

	public void setPopup_date(String popup_date) {
		this.popup_date = popup_date;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", writeDate=" + writeDate + ", hit=" + hit + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", file_name=" + file_name + ", uploadFile=" + uploadFile + ", popup_date=" + popup_date + "]";
	}
	
	
	
}
