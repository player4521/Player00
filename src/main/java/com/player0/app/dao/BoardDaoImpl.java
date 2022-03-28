package com.player0.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.player0.app.common.Criteria;
import com.player0.app.model.BoardReVo;
import com.player0.app.model.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final String NAMESPACE = "com.player0.app.mappers.BoardMapper";
	private final SqlSession sqlSession;

	@Inject
	public BoardDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void write(BoardVo boardVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".write", boardVo);
	}

	@Override
	public BoardVo read(Integer brdNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".select", brdNo);
	}

	@Override
	public void update(BoardVo boardVo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", boardVo);
	}

	@Override
	public void delete(Integer brdNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", brdNo);
	}

	@Override
	public List<BoardVo> boardListPaging(Criteria criteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".boardListPaging", criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria);
	}

	@Override
	public List<BoardReVo> boardReList(Integer brdNo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".boardReList", brdNo);
	}

	@Override
	public void boardReWrite(BoardReVo boardReVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".boardReWrite", boardReVo);
	}

	@Override
	public void boardReUpdate(BoardReVo boardReVo) throws Exception {
		sqlSession.update(NAMESPACE + ".boardReUpdate", boardReVo);
	}

	@Override
	public void boardReDelete(Integer brdNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".boardReDelete", brdNo);
	}

	@Override
	public List<BoardReVo> reListPaging(Integer brdNo, Criteria criteria) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("brdNo", brdNo);
		paramMap.put("criteria", criteria);
		return sqlSession.selectList(NAMESPACE + ".listPaging", paramMap);
	}

	@Override
	public int countReplies(Integer brdNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countReplies", brdNo);
	}

}
