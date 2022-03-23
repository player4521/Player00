package com.player0.app.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.player0.app.common.Criteria;
import com.player0.app.common.PageMaker;
import com.player0.app.model.BoardVo;
import com.player0.app.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;

	@Inject
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	// 등록 페이지 이동
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeGET() {
		logger.info("write GET...");
		return "board/write";
	}

	// 등록 처리
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writePOST(BoardVo boardVo, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("write POST...");
		logger.info(boardVo.toString());
		boardService.write(boardVo);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return "redirect:/board/listPaging";
	}

	// 페이징, 페이지 번호 적용후 리스트 이동
	@RequestMapping(value = "listPaging", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception {
		logger.info("listPaging ...");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		model.addAttribute("boardList", boardService.boardListPaging(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "/board/list_paging";
	}

	// 조회 페이지 이동
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String readPaging(@RequestParam("brd_no") int brd_no, @ModelAttribute("criteria") Criteria criteria,
			Model model) throws Exception {
		model.addAttribute("board", boardService.read(brd_no));
		return "/board/read";
	}

	// 수정 페이지 이동
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyGETPaging(@RequestParam("brd_no") int brdNo, @ModelAttribute("criteria") Criteria criteria,
			Model model) throws Exception {
		logger.info("modifyGetPaging ...");
		model.addAttribute("board", boardService.read(brdNo));
		return "/board/modify";
	}

	// 수정 처리
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPOSTPaging(BoardVo boardVo, Criteria criteria, RedirectAttributes redirectAttributes)
			throws Exception {
		logger.info("modifyPOSTPaging ...");
		boardService.update(boardVo);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/board/listPaging";
	}

	// 삭제 처리
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public String removePaging(@RequestParam("brd_no") int brdNo, Criteria criteria,
			RedirectAttributes redirectAttributes) throws Exception {
		logger.info("remove ...");
		boardService.delete(brdNo);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/board/listPaging";
	}

}
