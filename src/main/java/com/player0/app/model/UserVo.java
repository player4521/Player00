package com.player0.app.model;

import java.sql.Date;

public class UserVo {

	private Integer playerNo;
	private String playerPw;
	private String playerName;
	private String playerId;
	private int playerPhoneNo;
	private int playerBirth;
	private int playerGender;
	private String playerMail;
	private String playerAddress;
	private int playerGrade;
	private int deleteFlg;
	private Date reg_date;
	private Date edit_date;

	public Integer getPlayerNo() {
		return playerNo;
	}
	public void setPlayerNo(Integer playerNo) {
		this.playerNo = playerNo;
	}
	public String getPlayerPw() {
		return playerPw;
	}
	public void setPlayerPw(String playerPw) {
		this.playerPw = playerPw;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public String getPlayerId() {
		return playerId;
	}
	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}
	public int getPlayerPhoneNo() {
		return playerPhoneNo;
	}
	public void setPlayerPhoneNo(int playerPhoneNo) {
		this.playerPhoneNo = playerPhoneNo;
	}
	public int getPlayerBirth() {
		return playerBirth;
	}
	public void setPlayerBirth(int playerBirth) {
		this.playerBirth = playerBirth;
	}
	public int getPlayerGender() {
		return playerGender;
	}
	public void setPlayerGender(int playerGender) {
		this.playerGender = playerGender;
	}
	public String getPlayerMail() {
		return playerMail;
	}
	public void setPlayerMail(String playerMail) {
		this.playerMail = playerMail;
	}
	public String getPlayerAddress() {
		return playerAddress;
	}
	public void setPlayerAddress(String playerAddress) {
		this.playerAddress = playerAddress;
	}
	public int getPlayerGrade() {
		return playerGrade;
	}
	public void setPlayerGrade(int playerGrade) {
		this.playerGrade = playerGrade;
	}
	public int getDeleteFlg() {
		return deleteFlg;
	}
	public void setDeleteFlg(int deleteFlg) {
		this.deleteFlg = deleteFlg;
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
	
}
