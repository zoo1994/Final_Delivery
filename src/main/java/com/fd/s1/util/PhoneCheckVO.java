package com.fd.s1.util;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PhoneCheckVO {
	private Long num;
	private String phone;
	private LocalDateTime requestTime;
	private String checkNumber;
}
