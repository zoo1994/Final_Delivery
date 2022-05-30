package com.fd.s1.menu;

import java.awt.Menu;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.admin.AdminService;
import com.fd.s1.member.MemberVO;
import com.fd.s1.shop.ShopMenuVO;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;



@Controller
@RequestMapping("/menu/*")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private AdminService adminService;
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(MenuFileVO menuFileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("controller : "+menuFileVO.getFileNum());
		int result = menuService.setFileDelete(menuFileVO);
		
		mv.setViewName("common/result");
		mv.addObject("result",result);
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getList(MenuVO menuVO, Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setCategory(menuVO.getCategory());
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO == null) {
			pager.setUserType(2L);
		}else if(memberVO.getUserType() == 0L) {
			pager.setUserType(memberVO.getUserType());			 
		}else {
			pager.setUserType(1L);
		}
		List<MenuVO> ar = menuService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("category",menuVO.getCategory());
		mv.setViewName("menu/list");
		
		return mv;
	}
	
//	//관리자 메뉴 list
//	@GetMapping("menuManage")
//	public ModelAndView getMenuManage(MenuVO menuVO,Pager pager, HttpSession session) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		pager.setUserType(memberVO.getUserType());			
//		pager.setCategory(menuVO.getCategory());
//		List<MenuVO> ar = menuService.getList(pager);
//		mv.addObject("list",ar);
//		mv.setViewName("menu/menuManage");
//		return mv;
//	}
//	
//	//메뉴 상태 변경용 ajax
//	@PostMapping("menuManage")
//	public ModelAndView getMenuManage(MenuVO menuVO, Pager pager) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		int result = menuService.setUpdateSale(menuVO);
//		Long count = adminService.getShopListCount(pager);
//		System.out.println("count : "+count);
//		List<ShopVO> ar = adminService.getShop(pager, count);
//		if(menuVO.getMenuSale() != 1) {
//			for(int i = 0; i<ar.size();i++) {
//				ShopMenuVO shopMenuVO = new ShopMenuVO();
//				shopMenuVO.setMenuNum(menuVO.getMenuNum());
//				result = menuService.setDeleteMenu(shopMenuVO);
//			}
//		}else {
//			for(int i = 0; i<ar.size();i++) {
//				ShopMenuVO shopMenuVO = new ShopMenuVO();
//				shopMenuVO.setMenuNum(menuVO.getMenuNum());
//				shopMenuVO.setShopNum(ar.get(i).getShopNum());
//				result = menuService.setShopMenuAdd(shopMenuVO);
//			}
//		}
//		
//		mv.setViewName("common/result");
//		mv.addObject("result",result);
//		
//		return mv;
//	}

	
	@GetMapping("detail")
	public ModelAndView getDetail(MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		menuVO = menuService.getDetail(menuVO);
		mv.addObject("vo", menuVO);
		mv.setViewName("menu/detail");
		return mv;
	}
	
	//관리자 전용 menu Detail
	@GetMapping("manageDetail")
	public ModelAndView getManageDetail(MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		menuVO = menuService.getDetail(menuVO);
		mv.addObject("vo",menuVO);
		mv.setViewName("menu/manageDetail");
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setAdd(@ModelAttribute MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("menu/add");
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(@Valid MenuVO menuVO, BindingResult bindingResult, MultipartFile file, HttpSession session, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("post 진입");
		System.out.println(bindingResult.getFieldError());
		if(bindingResult.hasErrors()) {
			mv.setViewName("menu/add");
			return mv;
		}
		//System.out.println("controller : "+file.getBytes()+".");
		Long count = adminService.getShopListCount(pager);
		System.out.println("count : "+count);
		List<ShopVO> ar = adminService.getShop(pager, count);
		System.out.println("shop Count : "+ar.size());
		int result = menuService.setAdd(menuVO, file);
		//메뉴추가 성공했다면, 영양정보도 추가
		if(result > 0) {
			IngredientVO ingredientVO = new IngredientVO();
			ingredientVO.setMenuNum(menuVO.getMenuNum());
			ingredientVO.setWeight_g(menuVO.getIngredientVO().getWeight_g());
			ingredientVO.setWeight_ml(menuVO.getIngredientVO().getWeight_ml());
			ingredientVO.setCalory(menuVO.getIngredientVO().getCaffeine());
			ingredientVO.setSugar(menuVO.getIngredientVO().getSugar());
			ingredientVO.setProtein(menuVO.getIngredientVO().getProtein());
			ingredientVO.setFat(menuVO.getIngredientVO().getFat());
			ingredientVO.setSodium(menuVO.getIngredientVO().getSodium());
			ingredientVO.setCaffeine(menuVO.getIngredientVO().getCaffeine());
			result = menuService.setIngredientAdd(ingredientVO);
		}
		//메뉴추가 성공했다면, 전체 매장에도 매장메뉴 추가
		if(result >0) {
			for(int i=0; i<ar.size();i++) {
				System.out.println("shopName : "+ar.get(i).getShopName());
				ShopMenuVO shopMenuVO = new ShopMenuVO();
				shopMenuVO.setMenuNum(menuVO.getMenuNum());
				shopMenuVO.setShopNum(ar.get(i).getShopNum());
				result = menuService.setShopMenuAdd(shopMenuVO);
			}
		}
		mv.setViewName("redirect:./menuManage");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		menuVO = menuService.getDetail(menuVO);
		mv.addObject("menuVO", menuVO);
		mv.setViewName("menu/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(@Valid MenuVO menuVO, BindingResult bindingResult, MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		if(bindingResult.hasErrors()) {
			mv.setViewName("menu/update");
			return mv;
		}
		
		int result = menuService.setUpdate(menuVO, file);
		if(result > 0) {
			IngredientVO ingredientVO = new IngredientVO();
			ingredientVO.setMenuNum(menuVO.getMenuNum());
			ingredientVO.setWeight_g(menuVO.getIngredientVO().getWeight_g());
			ingredientVO.setWeight_ml(menuVO.getIngredientVO().getWeight_ml());
			ingredientVO.setCalory(menuVO.getIngredientVO().getCaffeine());
			ingredientVO.setSugar(menuVO.getIngredientVO().getSugar());
			ingredientVO.setProtein(menuVO.getIngredientVO().getProtein());
			ingredientVO.setFat(menuVO.getIngredientVO().getFat());
			ingredientVO.setSodium(menuVO.getIngredientVO().getSodium());
			ingredientVO.setCaffeine(menuVO.getIngredientVO().getCaffeine());
			result = menuService.setIngredientUpdate(ingredientVO);
		}
		
		mv.setViewName("redirect:./menuManage");
		
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDeleAndView(MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(menuVO.getMenuNum());
		int result = menuService.setDelete(menuVO);
		mv.setViewName("common/result");
		mv.addObject("result",result);
		
		return mv;
	}
}
