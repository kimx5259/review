package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Inject
	private MemberService mService;
	
	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public void logout() {
		
	}
	
	
	@RequestMapping(value = "/loginPost", method=RequestMethod.POST)
	public void loginPost(MemberVO vo, Model model) {
		
		MemberVO login = mService.login(vo);
		
		model.addAttribute("login", login);
		
		
	}
	
	
	
	@RequestMapping(value = "/loginGet", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	
	@RequestMapping(value = "/idcheck", 
			method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody /* ajax통신을 통해 jsp가 아니라 text를 받기 때문에 json파일을 받기위해 사용 */
	public String idcheck(String userid, Model model) {
		MemberVO vo = mService.idcheck(userid);
		String name = "중복검사";
		model.addAttribute("name", name);
		if(vo == null) {
			name = "사용 가능";
			return name;
			/* return "사용 가능"; */
		}else {
			name = "사용불가";
			return name;
			/* return "사용불가"; */
		}
		
		
	}
	
	
	@RequestMapping(value = "/searchByName/{userid}", method = RequestMethod.GET)
	public String searchByName(@PathVariable("userid") String userid, Model model) {
		List<MemberVO> list = mService.searchByName(userid);
		
		model.addAttribute("list", list);
		
		return "/member/searchByName";
	}
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) {
		List<MemberVO> list = mService.list();
		
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberVO vo) {
		mService.delete(vo);
		
		return "redirect:/";
	}
	
	
	@RequestMapping("/")
	public String main() {
		
		
		return "member/main";
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO vo) {
		mService.update(vo);
		
		return "redirect:/member/read/"+vo.getUserid();
	}
	
	
	@RequestMapping(value = "/update/{userid}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = mService.updateUI(userid);
		
		model.addAttribute("vo", vo);
		
		return "/member/update"; 
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertUI() {
		
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberVO vo) {
		mService.insertMember(vo);
		
		return "redirect:/member/read/"+vo.getUserid();
	}
	

	@RequestMapping(value = "/read/{userid}", method = RequestMethod.GET)
	public String read(@PathVariable("userid") String userid, Model model) {
		
		MemberVO vo = mService.read(userid);
		
		model.addAttribute("vo", vo);
		
		return "member/read";
		
	}

	@RequestMapping(value = "/passCheck", method = RequestMethod.POST)
	@ResponseBody
	public int passChk(MemberVO vo) {
		int result = mService.passChk(vo);
		return result;
	}
	
	
	
	
	
	
}
