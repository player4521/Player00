package com.player0.app.service;

import java.util.List;

import com.player0.app.common.Criteria;
import com.player0.app.model.BoardReVo;
import com.player0.app.model.BoardVo;

public interface BoardService {
	void write(BoardVo boardVo) throws Exception;

	BoardVo read(Integer brdNo) throws Exception;

	void update(BoardVo boardVo) throws Exception;

	void delete(Integer brdNo) throws Exception;

	List<BoardVo> boardListPaging(Criteria criteria) throws Exception;

	int countArticles(Criteria criteria) throws Exception;

	List<BoardReVo> boardReList(Integer brdNo) throws Exception;

	void boardReWrite(BoardReVo boardReVo) throws Exception;

	void boardReUpdate(BoardReVo boardReVo) throws Exception;

	void boardReDelete(Integer brdReNo) throws Exception;

	List<BoardReVo> reListPaging(Integer brdNo, Criteria criteria) throws Exception;

	int countReplies(Integer brdNo) throws Exception;

}
