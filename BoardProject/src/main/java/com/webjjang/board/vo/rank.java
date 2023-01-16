package com.webjjang.board.vo;


public class rank {
	
	private String value;
	private String count;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "test [value=" + value + ", count=" + count + "]";
	}

}
