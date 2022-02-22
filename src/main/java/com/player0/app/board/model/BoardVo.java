package com.player0.app.board.model;

import java.sql.Date;

public class BoardVo {
	private Integer brdNo;
	private String categoryCd;
	private String title;
	private String content;
	private String tag;
	private int viewCnt;
	private String userId;
	private Date regDate;
	private Date editDate;

	public Integer getBrdNo() {
		return brdNo;
	}


	public void setBrdNo(Integer brdNo) {
		this.brdNo = brdNo;
	}


	public String getCategoryCd() {
		return categoryCd;
	}


	public void setCategoryCd(String categoryCd) {
		this.categoryCd = categoryCd;
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


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public Date getEditDate() {
		return editDate;
	}


	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}

	@Override
	public String toString() {
		return "BoardVo [brdNo=" + brdNo + ", categoryCd=" + categoryCd + ", title=" + title + ", content="
				+ content + ", tag=" + tag + ", viewCnt=" + viewCnt + ", userId=" + userId + ", regDate=" + regDate
				+ ", editDate=" + editDate + "]";
	}

}
