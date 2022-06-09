package com.fd.s1.start;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomErrorController implements ErrorController  {// implements ErrorController 
	
    @GetMapping("/error")
    public String error (HttpServletRequest request, Model model) {
    	System.out.println("에러실행");
//        Object status = request.getAttribute("javax.servlet.error.status_code");

//        model.addAttribute("status", "상태:" + status);
//        model.addAttribute("path", request.getAttribute("javax.servlet.error.request_uri"));
//        model.addAttribute("timestamp", "date");//new Date()
//
//        Object exceptionObj = request.getAttribute("javax.servlet.error.exception");
//        if (exceptionObj != null) {
//            Throwable e = ((Exception) exceptionObj).getCause();
//            model.addAttribute("exception", e.getClass().getName());
//            model.addAttribute("message", e.getMessage());
//        }
//        System.out.println(HttpStatus.NOT_FOUND.value());
//        if (status.equals(HttpStatus.NOT_FOUND.value())) {
//            return "/errors/404";
//        } else if (status.equals(405)) {
//            return "/errors/405";
//        } else {
//            return "/errors/500";
//        }
        return "/errors/error";
    }	
}


