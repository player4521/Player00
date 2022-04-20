package com.player0.app.model;

import java.sql.Date;

public class BoardVo {
	private Integer brd_no;
	private String category_cd;
	private String title;
	private String content;
	private String tag;
	private int view_cnt;
	private int reply_cnt;
	private String player_id;
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

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public int getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	public String getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(String player_id) {
		this.player_id = player_id;
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
		return "BoardVo [brd_no=" + brd_no + ", category_cd=" + category_cd + ", title=" + title + ", content="
				+ content + ", tag=" + tag + ", view_cnt=" + view_cnt + ", reply_cnt=" + reply_cnt + ", player_id=" + player_id + ", reg_date=" + reg_date
				+ ", edit_date=" + edit_date + "]";
	}

}
