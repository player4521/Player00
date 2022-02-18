package com.player0.app.board.dao;

import java.util.List;

import com.player0.app.board.model.BoardVo;

public interface BoardDao {
	void insert(BoardVo boardVO) throws Exception;

	BoardVo select(Integer boardVO) throws Exception;

	void update(BoardVo boardVO) throws Exception;

	void delete(Integer boardVO) throws Exception;

	List<BoardVo> listAll() throws Exception;

}
