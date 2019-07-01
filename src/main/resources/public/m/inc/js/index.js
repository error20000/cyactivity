//  首页新服/老服切换
$('.btn_qf').click(function() {
	var index = $(this).index();
    $(this).addClass('on').siblings().removeClass('on');
    $('.yy_prize').eq(index).addClass('on').siblings().removeClass('on');
})

//回到顶部
$('.btn_top').click(function(){
	$('html, body').animate({'scrollTop': '0px'},500);
})

//点击立即预约按钮---是否显示预约弹窗
$('.btn_ljyy').click(function(){
	popup($('#pop1'));//未预约
//	popup($('#pop3'));//已预约
})

//点击预约弹窗立即预约按钮---是否显示预约成功
$('.box_btn_ljyy').click(function(){
	yyAdd();
})

//点击查看邀请码按钮
$('.box_btn_look').click(function(){
	hideMask($('.pop'));
	popup($('#pop4'));
})

//点击查看复制按钮
$('.box_btn_copy').click(function(){
	hideMask($('.pop'));
})

//点击领取奖品----显示绑定角色弹窗
$('.btn_get').click(function(){
	popup($('#pop6'));
})

//点击提交----显示绑定成功弹窗
$('.box_btn_submit').click(function(){
	hideMask($('.pop'));
	popup($('#pop7'));
})

//关闭弹窗
function closeDialog(){
	hideMask($('.pop'));
}

//预约弹窗选择系统
$('.btn_sys').click(function(){
	$(this).addClass('on').siblings().removeClass('on');
	var val = $(this).attr('title');
	console.log(val);
})

//选择系统 ,大区
$('.select_item').click(function(){
	$(this).siblings('.ul_list').show();
})
$('.ul_list li').click(function(){
	var val = $(this).text();
	$(this).parents('.ul_list').siblings('.select_item').text(val);
	$(this).parents('.ul_list').hide();
})

//inviteNum();
//根据当前邀请人数获取奖励
function inviteNum(){
	var yqCur = $('.yq_num').text(),//当前邀请人数
		yqArr = [1,3,5],//邀请等级人数
		count = 0;
	
		for(var i in yqArr){
			if(yqCur >= yqArr[i]){
				count++
				$('.prize_item').eq(i).children('.btn_get').addClass('active');
			}
		}
}
//setPrizeSize();
//设置预约奖品图片大小
function setPrizeSize(){
	var w = $('.yy_prize_img').eq(0).width();
	for(var i = 0; i< $('.yy_prize_img').length; i++){
		var img = $('.yy_prize_img').eq(i).children('img');
			if(img.length > 1){
				img.width(w/img.length);
			}
	}
}

