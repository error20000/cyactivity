
//var yyBaseUrl = "http://127.0.0.1:8580";
var test = true;

$(function(){
	yyInit();

	//获取验证码
	$('.btn_code_send').click(function(){
		var phone = $('#pop1 .input_phone')。value()
	});
});

var yyInit = function(){
		yyTotalNum();
		yyGiftType();
		yyInvite();
		yyInviteNum("123");
		yyInfoPhone("13888888881");
};

//获取预约人数
var yyTotalNum = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/num";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyTotalNumRes;
		}
		//res
		if(res.code === 10000) {
			$('.yy_num').html(res.data);
		}
	});
};

//获取预约奖项
var yyGiftType = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/gift/type/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyGiftTypeRes;
		}
		//res
		if(res.code === 10000) {
			var types = res.data;
			//排序
			for (var i = 0; i < types.length; i++) {
				for (var j = i; j < types.length; j++) {
					if(types[i].num > types[j].num){
						var temp = types[i];
						types[i] = types[j];
						types[j] = temp;
					}
				}
			}
			yyGiftItem(types);
		}
	});
};

//获取预约奖励
var yyGiftItem = function(giftTypes){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/gift/item/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyGiftItemRes;
		}
		//res
		if(res.code === 10000) {
			var str = ''; //yy_prize_inner
			var pstr = ''; //progrss_line
			var curNum = Number($('.yy_num').text());
			for (var i = 0; i < giftTypes.length; i++) { //遍历分类
				var type = giftTypes[i];
				str += '<div class="yy_prize_item yy_prize_item'+(i+1)+' '+(curNum >= type.num ? 'on' : '')+'">';
				str += '<div class="yy_suc_num">'+type.name+'</div>';
				str += '<div class="yy_prize_img">';
				var name = "";
				for (var j = 0; j < res.data.length; j++) { //遍历奖项
					var item = res.data[j];
					if(type.pid == item.type){
						name += item.name+"*"+item.num+" ";
						str += '	<img src="'+item.icon+'" with="72px" height="72px" />';
					}
				}
				str += '</div>';
				str += '<div class="yy_prize_name">'+name+'</div>';
				str += '<div class="yy_status_suc"></div>';
				str += '</div>';
				
				if(i != 0){
					pstr += '<div class="progrss_line line_'+i+' '+(curNum >= type.num ? 'on' : '')+'"></div>';
				}
			}
			$('.yy_prize1 .yy_prize_inner').html(str);
			$('.yy_prize1 .yy_progress').html(pstr);
			$('.yy_prize2 .yy_prize_inner').html(str);
			$('.yy_prize2 .yy_progress').html(pstr);
		}
	});
};

//获取邀请奖项
var yyInvite = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/invite/gift/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyInviteRes;
		}
		//res
		if(res.code === 10000) {
			var types = res.data;
			//排序
			for (var i = 0; i < types.length; i++) {
				for (var j = i; j < types.length; j++) {
					if(types[i].num > types[j].num){
						var temp = types[i];
						types[i] = types[j];
						types[j] = temp;
					}
				}
			}
			//遍历
			var curNum = $('.yq_num').text();
			var str = '';
			for (var i = 0; i < types.length; i++) {
				var item = types[i];
				str += '<div class="prize_item prize_item1">';
				str += '<div class="prize_item_img">';
				str += '	<div class="yq_count">邀请<span>'+item.num+'</span>人</div>';
				str += '	<div class="yq_prize_img">';
				str += '		<img src="'+item.icon+'" with="72px" height="72px" />';
				str += '	</div>';
				str += '	<div class="yq_prize_name">'+item.name+'</div>';
				str += '</div>';
				str += '<a class="btn_get '+(curNum >= item.num ? 'active' : '')+'" href="javascript:;" title="领取奖励"></a>';
				str += '</div>';
			}
			$('.yq_prize').html(str);
		}
	});
};

//通过手机号查询预约信息
var yyInfoPhone = function(phone){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/phone/" + phone;
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyInfoRes;
		}
		//res
		if(res.code === 10000) {
			$('.yqm_num').html(res.data.invite_code);
		}
	});
};

//通过openid查询预约信息
var yyInfoOpenid = function(openid){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/openid/" + openid;
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyInfoRes;
		}
		//res
		if(res.code === 10000) {
			$('.yqm_num').html(res.data.invite_code);
		}
	});
};

//查询邀请人数
var yyInviteNum = function(inviteCode){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/invite/num/" + inviteCode;
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		//test
		if(test){
			res = yyInviteNumRes;
		}
		//res
		if(res.code === 10000) {
			$('.yq_num').html(res.data);
		}
	});
};


//参与预约
var yyAdd = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/add";
	var data = {
		plat: $('#pop1 .btn_sys.on').attr('title'),
		phone: $('#pop1 .input_phone')。value(),
		vcode: $('#pop1 .input_code')。value(),
		used_code: $('#pop1 .input_invite_code')。value()
	};
	cyja.client.ajax('post', url, data, function(res){
		console.log(res);
		if(res.code === 10000) {
			//切换效果
			hideMask($('.pop'));
			popup($('#pop2'));
		}
	});
};


