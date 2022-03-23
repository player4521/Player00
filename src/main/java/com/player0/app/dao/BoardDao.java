package com.player0.app.dao;

import java.util.List;

import com.player0.app.common.Criteria;
import com.player0.app.model.BoardVo;

public interface BoardDao {
	void write(BoardVo boardVo) throws Exception;

	BoardVo read(Integer brdNo) throws Exception;

	void update(BoardVo boardVo) throws Exception;

	void delete(Integer brdNo) throws Exception;

	List<BoardVo> boardListPaging(Criteria criteria) throws Exception;

	int countArticles(Criteria criteria) throws Exception;

}
