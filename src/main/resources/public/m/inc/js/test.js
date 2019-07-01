

//获取预约人数
var yyTotalNumRes = {
	code: 10000,
	data: Math.floor(Math.random()*100000)
};

//获取预约奖项
var yyGiftTypeRes = {
	code : 10000,
	data: [{
		pid: 1,
		name: "1万预约",
		num: 10000
	},{
		pid: 2,
		name: "2万预约",
		num: 20000
	},{
		pid:3,
		name: "3万预约",
		num: 30000
	}/*,{
		pid:4,
		name: "4万预约",
		num: 40000
	},{
		pid:5,
		name: "5万预约",
		num: 40000
	}*/]
};

//获取预约奖励
var yyGiftItemRes = {
	code : 10000,
	data: [{
		type: 1,
		name: "3级穿透宝石",
		num: 1,
		icon: "inc/images/prize.png"
	},{
		type: 1,
		name: "3级穿透宝石",
		num: 2,
		icon: "inc/images/prize.png"
	},{
		type: 2,
		name: "3级穿透宝石",
		num: 3,
		icon: "inc/images/prize.png"
	},{
		type: 3,
		name: "3级穿透宝石",
		num: 4,
		icon: "inc/images/prize.png"
	},{
		type: 4,
		name: "3级穿透宝石",
		num: 4,
		icon: "inc/images/prize.png"
	},{
		type: 5,
		name: "3级穿透宝石",
		num: 5,
		icon: "inc/images/prize.png"
	}]
};

//获取邀请奖项
var yyInviteRes = {
		code : 10000,
		data: [{
			pid: 1,
			name: "3级穿透宝石*1",
			num: 1,
			icon: "inc/images/prize.png"
		},{
			pid: 2,
			name: "3级穿透宝石*3",
			num: 3,
			icon: "inc/images/prize.png"
		},{
			pid: 3,
			name: "3级穿透宝石*5",
			num: 5,
			icon: ""
		}]
	};

//通过手机号查询预约信息
var yyInfoRes = {
		code : 10000,
		data: {
			plat: 'ios',
			phone: '13888888881',
			invite_code: 'xxx3333xxx',
			used_code: '22222',
		}
};

//查询邀请人数
var yyInviteNumRes = {
	code : 10000,
	data: 3
};



