package com.player0.app.model;

import java.sql.Date;

public class BoardReVo {
	private Integer brdReNo;
	private Integer brdNo;
	private String reContent;
	private String playerId;
	private Date regDate;
	private Date editDate;

	public Integer getBrdReNo() {
		return brdReNo;
	}

	public void setBrdReNo(Integer brdReNo) {
		this.brdReNo = brdReNo;
	}

	public Integer getBrdNo() {
		return brdNo;
	}

	public void setBrdNo(Integer brdNo) {
		this.brdNo = brdNo;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getPlayerId() {
		return playerId;
	}

	public void setPlayerId(String playerId) {
		this.playerId = playerId;
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
		return "BoardReVo [brdReNo=" + brdReNo + ", brdNo=" + brdNo + ", reContent=" + reContent + ", playerId=" + playerId
				+ ", regDate=" + regDate + ", editDate=" + editDate + "]";
	}

}
