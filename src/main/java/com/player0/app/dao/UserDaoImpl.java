package com.player0.app.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.player0.app.model.UserVo;

@Repository
public class UserDaoImpl implements UserDao{

	private static final String NAMESPACE = "com.player0.app.mappers.User.UserMapper";
	private final SqlSession sqlSession;

	@Inject 
	public UserDaoImpl(SqlSession sqlSession) { 
		this.sqlSession = sqlSession; 
		}

	// 회원가입처리
	@Override
	public void register(UserVo userVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".register", userVo);
	}

}
