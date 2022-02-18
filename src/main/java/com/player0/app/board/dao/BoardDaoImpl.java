package com.player0.app.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.player0.app.board.model.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final String NAMESPACE = "com.player0.app.board.mappers.BoardMapper";
	private final SqlSession sqlSession;

	@Inject
	public BoardDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insert(BoardVo BoardVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", BoardVO);
	}

	public BoardVo select(Integer Board_no) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".select", Board_no);
	}

	public void update(BoardVo BoardVO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", BoardVO);
	}

	public void delete(Integer Board_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", Board_no);
	}

	public List<BoardVo> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

}
