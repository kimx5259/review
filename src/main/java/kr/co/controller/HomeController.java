package kr.co.controller;



import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.service.MemberService;


@Controller
@RequestMapping("")
public class HomeController {
	
	@Inject
	private MemberService mService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<MemberVO> list = mService.list();
		model.addAttribute("list", list);
		
		
		return "home";
	}
}
 	