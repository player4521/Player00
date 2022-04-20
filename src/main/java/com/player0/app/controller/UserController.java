package com.player0.app.controller;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.player0.app.model.UserVo;
import com.player0.app.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
//	private final UserService userService;
//
//	@Inject
//	public UserController(UserService userService) {
//		this.userService = userService;
//	}
//
//	// 회원가입 페이지
//	@RequestMapping(value = "register", method = RequestMethod.GET)
//	public String registerGET() throws Exception {
//		return "/user/register";
//	}
//
//	// 회원가입 처리
//	@RequestMapping(value = "register", method = RequestMethod.POST)
//	public String registerPOST(UserVo userVo, RedirectAttributes redirectAttributes) throws Exception {
//		String hashPw = BCrypt.hashpw(userVo.getPlayerPw(), BCrypt.gensalt());
//		userVo.setPlayerPw(hashPw);
//		userService.register(userVo);
//		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
//		return "redirect:/user/login";
//	}
//
//	// 로그인 페이지 (임시로여기에 작성하고추후UserLoginController에서시 작성)
//	@RequestMapping(value = "login", method = RequestMethod.GET)
//	public String login() throws Exception {
//		return "/user/login";
//	}

//	// 로그인 처리
//	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
//	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
//		UserVO userVO = userService.login(loginDTO);
//		if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) {
//			return;
//		}
//		model.addAttribute("user", userVO);
//	}

}
