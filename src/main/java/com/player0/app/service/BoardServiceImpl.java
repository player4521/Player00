package com.player0.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.player0.app.common.Criteria;
import com.player0.app.dao.BoardDao;
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
	public List<BoardVo> getBoardList() throws Exception {
		return boardDao.getBoardList();
	}

	@Override
	public List<BoardVo> listCriteria(Criteria criteria) throws Exception {
	    return boardDao.listCriteria(criteria);
	}
}
