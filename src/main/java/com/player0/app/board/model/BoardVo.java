package com.player0.app.board.model;

import java.sql.Date;

public class BoardVo {
	private Integer brd_no;
	private String category_cd;
	private String title;
	private String content;
	private String tag;
	private int viewCnt;
	private String user_id;
	private Date reg_date;
	private Date edit_date;

	public Integer getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(Integer brd_no) {
		this.brd_no = brd_no;
	}

	public String getCategory_cd() {
		return category_cd;
	}

	public void setCategory_cd(String category_cd) {
		this.category_cd = category_cd;
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getEdit_date() {
		return edit_date;
	}

	public void setEdit_date(Date edit_date) {
		this.edit_date = edit_date;
	}

	@Override
	public String toString() {
		return "BoardVO [brd_no=" + brd_no + ", category_cd=" + category_cd + ", title=" + title + ", content="
				+ content + ", tag=" + tag + ", viewCnt=" + viewCnt + ", user_id=" + user_id + ", reg_date=" + reg_date
				+ ", edit_date=" + edit_date + "]";
	}

}
