package com.player0.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.player0.app.common.Criteria;
import com.player0.app.dao.BoardDao;
import com.player0.app.model.BoardReVo;
import com.player0.app.model.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private final BoardDao boardDao;

	@Inject
	public BoardServiceImpl(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public void write(BoardVo boardVo) throws Exception {
		boardDao.write(boardVo);
	}

	@Transactional
	@Override
	public BoardVo read(Integer brdNo) throws Exception {
		return boardDao.read(brdNo);
	}

	@Override
	public void update(BoardVo boardVo) throws Exception {
		boardDao.update(boardVo);
	}

	@Override
	public void delete(Integer brdNo) throws Exception {
		boardDao.delete(brdNo);
	}

	@Override
	public List<BoardVo> boardListPaging(Criteria criteria) throws Exception {
		return boardDao.boardListPaging(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return boardDao.countArticles(criteria);
	}

	@Override
	public List<BoardReVo> boardReList(Integer brdNo) throws Exception {
		return boardDao.boardReList(brdNo);
	}

	@Override
	public void boardReWrite(BoardReVo boardReVo) throws Exception {
		boardDao.boardReWrite(boardReVo);
	}

	@Override
	public void boardReUpdate(BoardReVo boardReVo) throws Exception {
		boardDao.boardReUpdate(boardReVo);
	}

	@Override
	public void boardReDelete(Integer brdReNo) throws Exception {
		boardDao.boardReDelete(brdReNo);
	}

	@Override
	public List<BoardReVo> replyList(Integer brdNo, Criteria criteria) throws Exception {
		return boardDao.replyList(brdNo, criteria);
	}

	@Override
	public int countReplies(Integer brdNo) throws Exception {
		return boardDao.countReplies(brdNo);
	}

}
