
var yyBaseUrl = "http://127.0.0.1:8580";

$(function(){
	yyInit();
});

var yyInit = function(){
		yyTotalNum();
		yyGiftType();
		yyInvite();
};

//获取预约人数
var yyTotalNum = function(){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/active/num";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			$('.yy_mun').html(res.data);
		}
	});
};

//获取预约奖项
var yyGiftType = function(){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/gift/type/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			yyGiftItem(res.data);
		}
	});
};

//获取预约奖励
var yyGiftItem = function(giftType){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/gift/item/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			//
		}
	});
};

//获取邀请奖项
var yyInvite = function(){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/invite/gift/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			//
		}
	});
};

//通过手机号查询预约信息
var yyInfo = function(phone){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/active/phone/" + phone;
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			//
		}
	});
};

//通过openid查询预约信息
var yyInfo = function(openid){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/active/openid/" + openid;
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			//
		}
	});
};

//查询邀请人数
var yyInviteNum = function(inviteCode){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/active/invite/num/" + inviteCode;
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			//
		}
	});
};

//参与预约
var yyAdd = function(){
	var url = yyBaseUrl + "/wb/" + cyja.options.server + "/active/add";
	var data = {
		vcode: "",
		plat: "",
		phone: "",
		used_code: ""
	};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		if(res.code === 20000) {
			//
		}
	});
};


