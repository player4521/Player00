package com.player0.app.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		return "redirect:/board/list";
	}

	// 목록 페이지 이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("list ...");
		model.addAttribute("board", boardService.listAll());
		return "board/list";
	}

	// 조회 페이지 이동
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(@RequestParam("brd_no") int brdNo, Model model) throws Exception {
		System.out.println(brdNo);
		logger.info("read ...");
		model.addAttribute("board", boardService.read(brdNo));
		return "board/read";
	}

	// 수정 페이지 이동
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("brd_no") int brdNo, Model model) throws Exception {
		logger.info("modifyGet ...");
		model.addAttribute("board", boardService.read(brdNo));
		return "board/modify";
	}

	// 수정 처리
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVo boardVo, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("modifyPOST ...");
		boardService.update(boardVo);
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/board/list";
	}

	// 삭제 처리
	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public String remove(@RequestParam("brd_no") int brdNo, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("remove ...");
		boardService.delete(brdNo);
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/board/list";
	}
}
