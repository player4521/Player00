package com.player0.app.domain;

public class LoginDto {
	private String playerId;
	private String playerPw;
	private boolean useCookie;

	public String getPlayerId() {
		return playerId;
	}

	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}

	public String getPlayerPw() {
		return playerPw;
	}

	public void setPlayerPw(String playerPw) {
		this.playerPw = playerPw;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	@Override
	public String toString() {
		return "LoginDTO{" + "playerId='" + playerId + '\'' + ", playerPw='" + playerPw + '\'' + ", useCookie="
				+ useCookie + '}';
	}
}
