package com.changyou.activity.util;

import java.util.Random;

public class Utils {

	

	/**
	 * 生成随机数
	 * @param length 随机数长度
	 * @return 返回字符串类型
	 */
	public static String createVCodeNumber(int length) {
		return createVCode(length, "num", false, "");
	}
	
	/**
	 * 生成随机字符串
	 * @param length 随机字符串长度
	 * @param capType 字母大小写。"A"大写，"a"小写，其他随机大小写
	 * @return 返回字符串类型
	 */
	public static String createVCodeString(int length, String capType) {
		return createVCode(length, "char", false, capType);
	}
	
	/**
	 * 生成随机字符串
	 * @param length 随机字符串长度
	 * @param codeType 字符类型。"num"数字，"char"字母，其他随机数字、字母
	 * @param ram {@code codeType} 为其他时，ram才有效。true表示数字字母间隔出现，false随机出现
	 * @param capType 字母大小写。"A"大写，"a"小写，其他随机大小写
	 * @return 返回字符串类型
	 */
	public static String createVCode(int length, String codeType, boolean ram, String capType ) {
		String val = "";
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			String charOrNum = i % 2 == 0 ? "num" : "char"; //数字 字母间隔
			switch (codeType) {
			case "num":
				charOrNum =  "num" ; //数字
				break;
			case "char":
				charOrNum =  "char" ; // 字母
				break;
			default:
				if(ram){  //随机 数字 字母
					if(random.nextInt(2) % 2 == 0){
						charOrNum =  "num" ; //数字
					}else{
						charOrNum =  "char" ; // 字母
					}
				}
				break;
			}
			
			if ("char".equalsIgnoreCase(charOrNum)){ 
				int choice = random.nextInt(2) % 2 == 0 ? 65 : 97;  
				switch (capType) {
				case "A":
					choice = 97; //大写
					break;
				case "a":
					choice = 65; // 小写
					break;
				default:
					break;
				}
				val += (char) (choice + random.nextInt(26));
			} else if ("num".equalsIgnoreCase(charOrNum)){ 
				val += String.valueOf(random.nextInt(10));
			}
		}
		return val;
	}
	
	public static void main(String[] args) {
		System.out.println(createVCode(6, "", false, "a"));
	}
}
