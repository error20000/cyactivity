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


inviteNum();
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


