package com.player0.app.board.service;

import java.util.List;

import com.player0.app.board.model.BoardVo;

public interface BoardService {
	void write(BoardVo boardVo) throws Exception;

	BoardVo select(Integer brdNo) throws Exception;

	void update(BoardVo boardVo) throws Exception;

	void delete(Integer brdNo) throws Exception;

	List<BoardVo> listAll() throws Exception;
}
