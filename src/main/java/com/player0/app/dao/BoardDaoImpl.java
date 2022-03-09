package com.player0.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.player0.app.model.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final String NAMESPACE = "com.player0.app.mappers.BoardMapper";
	private final SqlSession sqlSession;

	@Inject
	public BoardDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void write(BoardVo boardVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".write", boardVo);
	}

	public BoardVo read(Integer brdNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".select", brdNo);
	}

	public void update(BoardVo boardVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", boardVo);
	}

	public void delete(Integer brdNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", brdNo);
	}

	public List<BoardVo> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

}
