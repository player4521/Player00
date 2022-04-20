package com.player0.app.dao;

import com.player0.app.model.UserVo;

public interface UserDao {
	// 회원가입 처리
	void register(UserVo userVo) throws Exception;

}
