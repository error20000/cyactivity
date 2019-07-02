
var yyUserInfo;
var yyUserIsLogin;

//已登录初始化
var yyLoginInit = function(res){
	yyTotalNum();
	yyGiftType();
	yyInviteGift();
	yyInfo();
	yyInviteNum();
	//页面
	$('.lg_welcome').addClass('lg_show');
	$('.lg_welcome span').html(res.data.openid);
	yyUserIsLogin = true;
	//获取验证码
	$('.btn_code_send').click(function(){
		var phone = $('#pop1 .input_phone').val();
		if(phone){
			cyja.user.getCode(phone, function(res){
				
			});
		}else{
			alert('请输入手机号');
		}
	});
	//退出
	$('.btn_quit').click(function(){
		cyja.user.logout();
	});
}

//未登录初始化
var yyNoLoginInit = function(data){
	yyTotalNum();
	yyGiftType();
	yyInviteGift();
	//样式
	yyhideInfo();
}

var yyhideInfo = function(){
	$('.lg_welcome').removeClass('lg_show');
	$('.yqm_txt').removeClass('lg_show');
	$('.yq_txt').removeClass('lg_show');
};

//获取预约人数
var yyTotalNum = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/num";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
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
var yyInviteGift = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/invite/gift/all";
	var data = {};
	cyja.client.ajax('get', url, data, function(res){
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
			//绑定事件
			//点击领取奖品----显示绑定角色弹窗
			$('.btn_get').click(function(){
				popup($('#pop6'));
			})
		}
	});
};

//查询预约信息
var yyInfo = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/info";
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		//res
		if(res.code === 10000) {
			yyUserInfo = res.data;
			$('.code_link').html(window.location.href);
			if(yyUserInfo){
				$('.yqm_num').html(res.data.inviteCode);
				$('.code_txt').html(res.data.inviteCode);
				$('.yqm_txt').addClass('lg_show');
			}else{
				$('.yqm_num').html('');
				$('.code_txt').html('');
			}
		}
	});
}

//查询邀请人数
var yyInviteNum = function(inviteCode){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/invite/num";
	var data = {};
	cyja.client.ajax('post', url, data, function(res){
		//res
		if(res.code === 10000) {
			$('.yq_num').html(res.data);
			$('.yq_txt').addClass('lg_show');
		}
	});
};


//参与预约
var yyAdd = function(){
	var url = cyja.options.host + "/wb/" + cyja.options.server + "/active/add";
	var data = {
		plat: $('#pop1 .btn_sys.on').attr('title'),
		phone: $('#pop1 .input_phone').val(),
		vcode: $('#pop1 .input_code').val(),
		used_code: $('#pop1 .input_invite_code').val()
	};
	cyja.client.ajax('post', url, data, function(res){
		if(res.code === 10000) {
			//切换效果
			hideMask($('.pop'));
			popup($('#pop2'));
			//查询
			yyInfo();
		}else if(res.code === 20011){
			popup($('#pop3'));//已预约
			//查询
			yyInfo();
		}else{
			alert(res.message);
		}
		yyBtnIsClick = false; 
	});
};


