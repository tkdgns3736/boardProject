package com.webjjang.board.vo;

import java.util.Date;

public class UserVO {
	private String userid;
	private String userpw;
	private String username;
	private String userpw_check;
	private Date user_date;
	private String name; //카카오 인증용 유저 이름
	private String birth; //카카오 인증용 유저 생년월일
	private String phone; //카카오 인증용 유저 전화번호
	
	
	

	public Date getUser_date() {
		return user_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	public String getUserpw_check() {
		return userpw_check;
	}
	public void setUserpw_check(String userpw_check) {
		this.userpw_check = userpw_check;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", userpw_check="
				+ userpw_check + ", user_date=" + user_date + ", name=" + name + ", birth=" + birth + ", phone=" + phone
				+ "]";
	}
	
}
