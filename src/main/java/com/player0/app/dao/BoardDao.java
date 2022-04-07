package com.player0.app.dao;

import java.util.List;

import com.player0.app.common.Criteria;
import com.player0.app.model.BoardReVo;
import com.player0.app.model.BoardVo;

public interface BoardDao {
	List<BoardVo> boardListPaging(Criteria criteria) throws Exception;

	int getBoardNo(Integer brdNo) throws Exception;

	BoardVo read(Integer brdNo) throws Exception;

	void write(BoardVo boardVo) throws Exception;

	void update(BoardVo boardVo) throws Exception;

	void delete(Integer brdNo) throws Exception;

	int countArticles(Criteria criteria) throws Exception;

	List<BoardReVo> boardReList(Integer brdNo) throws Exception;

	void boardReWrite(BoardReVo boardReVo) throws Exception;

	void boardReUpdate(BoardReVo boardReVo) throws Exception;

	void boardReDelete(Integer brdReNo) throws Exception;

	List<BoardReVo> replyList(Integer brdNo, Criteria criteria) throws Exception;

	int countReplies(Integer brdNo) throws Exception;

	void updateReplyCnt(Integer brdNo, int replyCnt) throws Exception;

	void updateViewCnt(Integer brdNo) throws Exception;
}
