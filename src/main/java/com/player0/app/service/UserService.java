package com.player0.app.service;

import com.player0.app.model.UserVo;

public interface UserService {

	// 회원 가입 처리
	void register(UserVo userVo) throws Exception;
}
