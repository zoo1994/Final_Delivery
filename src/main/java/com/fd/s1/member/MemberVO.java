package com.fd.s1.member;

import java.time.LocalDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
	@Size(min=5,max=15,message="아이디는 5자이상 15자이하만 사용가능합니다.")
	private String id;
	@Size(min=5,max=15,message="비밀번호는 5자이상 15자이하만 사용가능합니다.")
	@Pattern(regexp = "((?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,20})",message="숫자+영문자+특수문자 조합으로 8자리 이상 20자리 이하로 사용해야 합니다.")
	private String pw;
	private String checkPw;
	@NotBlank(message="필수 입력 정보입니다.")
	private String name;
	@Email(message="이메일 형식에 맞게 입력해주세요.")
	@NotBlank(message="필수 입력 정보입니다.")
	private String email;
	@NotBlank(message="필수 입력 정보입니다.")
	private String phone;
	private Long point;
	private Long gender;
	private LocalDate birth;
	@NotNull(message="연도를 입력하세요.")
	private Long year;
	private String month;
	private String day;
	private String postcode;
	private String roadAddress;
	private String detailAddress;
	private Long userType;
}
