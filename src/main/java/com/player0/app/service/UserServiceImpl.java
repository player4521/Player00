package com.player0.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.player0.app.dao.UserDao;
import com.player0.app.model.UserVo;

@Service
public class UserServiceImpl implements UserService{

	private final UserDao userDao;
	
	@Inject
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}
	
	// 회원 가입 처리
	@Override
	public void register(UserVo userVo) throws Exception{
		userDao.register(userVo);
	}
}
