package com.player0.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.player0.app.common.Criteria;
import com.player0.app.common.PageMaker;
import com.player0.app.model.BoardReVo;
import com.player0.app.service.BoardService;

// rest 방식으로 구현한 컨트롤러
@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	private final BoardService boardService;

	@Inject
	public ReplyController(BoardService boardService) {
		this.boardService = boardService;
	}

	// 댓글 목록
	@RequestMapping(value = "/{brdNo}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyList(@PathVariable("brdNo") Integer brdNo,
			@PathVariable("page") Integer page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);

			List<BoardReVo> replies = boardService.replyList(brdNo, criteria);
			int reCount = boardService.countReplies(brdNo);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(reCount);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("replies", replies);
			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody BoardReVo boardReVo) {
		ResponseEntity<String> entity = null;
		try {
			boardService.boardReWrite(boardReVo);
			entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 수정
	@RequestMapping(value = "/{brdReNo}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("brdReNo") Integer brdReNo, @RequestBody BoardReVo boardReVo) {
		ResponseEntity<String> entity = null;
		try {
			boardReVo.setBrdReNo(brdReNo);
			boardService.boardReUpdate(boardReVo);
			entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 댓글 삭제
	@RequestMapping(value = "/{brdReNo}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("brdReNo") Integer brdReNo) {
		ResponseEntity<String> entity = null;
		try {
			boardService.boardReDelete(brdReNo);
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
