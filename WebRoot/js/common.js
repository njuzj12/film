function login(name){
	var header_login_name=document.getElementById("header_login_name");
	header_login_name.innerHTML=name;
	var header_logout=document.getElementById("header_logout");
	header_logout.style.display="none";
	var header_login=document.getElementById("header_login");
	header_login.style.display="block";
}

function changeHeadToLogout(){
	var header_login_name=document.getElementById("header_login_name");
	header_login_name.innerHTML="未登陆";
	var header_logout=document.getElementById("header_logout");
	header_logout.style.display="block";
	var header_login=document.getElementById("header_login");
	header_login.style.display="none";
}

function logout(){
	changeHeadToLogout();
	$.ajax({  
        url:"json/ajaxUserAction_logout.action",  
        type:"POST",  
        dataType:"json",  
        success:function(data){ 
//            alert("退出成功");
        }  
    });
}


function recharge(){
	$.ajax({  
		url:"json/ajaxUserAction_recharge.action",  
		type:"POST",  
		data: {"recharge":$("#recharge").val(),"bankId":$("#bankId").val(),"password":$("#bankPass").val()},
		dataType:"json",  
		success:function(data){
			if (data.message=="success"){
				window.location.href="useraction_rechargeRecord.action";
			} else {
				alert(data.message);
			}
		}
	});
}

function proprocess(){
	var name=document.getElementById("header_name").value;
	if (name!='null'){
		login(name);
	}else {
		changeHeadToLogout();
	}
}

function addFilm(roomIdV,timeIdV){
//	alert(roomId);
	//获得页面大小
	var screenWidth = document.body.clientWidth;
	var screenHeight = document.body.clientHeight;
	
	//创建窗口的蒙版
	var window_mask=document.createElement('div');
	window_mask.style.opacity=0.5;
	window_mask.style.zIndex=30000;
	window_mask.style.width=screenWidth+'px';
	window_mask.style.height=screenHeight+'px';
	window_mask.style.display='block';
	window_mask.style.backgroundColor='rgb(84, 84, 84)';
	window_mask.id='window_mask';
	window_mask.style.position='absolute';
	window_mask.style.top=0;
	window_mask.style.left=0;
	var mybody = document.getElementsByTagName('body')[0];  
	mybody.appendChild(window_mask);
	
	var bbd=document.createElement('div');
	bbd.id="bbdId";
	bbd.style.position='absolute';
	bbd.style.top=95+'px';
	bbd.style.left=(screenWidth-600)/2+'px';
	bbd.style.width='600px';
	bbd.style.height='175px';
	bbd.style.zIndex=30000;
	bbd.style.display='block';
	bbd.style.overflow='hidden';
	mybody.appendChild(bbd);
	
	var bbd_wrapper=document.createElement('div');
	bbd_wrapper.style.marginTop="0px";
	bbd_wrapper.style.marginLeft="-3";
	bbd_wrapper.style.display='block';
	bbd.appendChild(bbd_wrapper);
	
	var bbd_iframe=document.createElement('iframe');
	bbd_iframe.id="iframe" ;
	bbd_iframe.width="400px";
	bbd_iframe.height="175px";
	bbd_iframe.frameborder="1";
	bbd_iframe.scrolling="no";
	bbd_iframe.src="filmaction_filmToAdd.action";
	bbd_wrapper.appendChild(bbd_iframe);
    
    var roomId=document.createElement("input");
	roomId.id="roomId";
	roomId.name=roomIdV;
	roomId.style.display='none';
	bbd_wrapper.appendChild(roomId);
    
    var timeId=document.createElement("input");
    timeId.id="timeId";
    timeId.name=timeIdV;
    timeId.style.display='none';
    bbd_wrapper.appendChild(timeId);
}

function ajax_sendPlan(filmId){
	$.ajax({  
        url:"json/ajaxFilmAction_sendPlan.action",  
        type:"POST",  
        data: {"roomId":$("#roomId").attr("name"),"timeId":$("#timeId").attr("name"),"filmId":filmId,"playTime":$("#playTime").val()},
        dataType:"json",  
        success:function(data){
        	//修改td的颜色
        	var targetTdObject=document.getElementById("td"+data.vo.roomId+"+"+data.vo.timeId);
        	targetTdObject.className="danger";
        	
        	//修改a中的链接
        	var targetAObject=document.getElementById("a"+data.vo.roomId+"+"+data.vo.timeId);
//        	targetAObject.onclick="ajax_removePlan("+data.vo.roomId+","+data.vo.timeId+")";
        	targetAObject.setAttribute("onclick","ajax_removePlan("+data.vo.roomId+","+data.vo.timeId+")");
        	//修改图标
        	var targetIObject=document.getElementById("i"+data.vo.roomId+"+"+data.vo.timeId);
        	targetIObject.className="icon-remove";
        	
        	myid=data.vo.roomId+"+"+data.vo.timeId;
            var targetObject=document.getElementById(myid);
            targetObject.innerHTML=data.vo.filmName;
        }  
    });
	closeFilmToAdd();
}

function ajax_removePlan(roomId,timeId){
	$.ajax({  
        url:"json/ajaxFilmAction_removePlan.action",  
        type:"POST",  
        data: {"roomId":roomId,"timeId":timeId,"playTime":$("#playTime").val()},
        dataType:"json",  
        success:function(data){
        	//修改td的颜色
        	var targetTdObject=document.getElementById("td"+data.vo.roomId+"+"+data.vo.timeId);
        	targetTdObject.className="";
        	
        	//修改a中的链接
        	var targetAObject=document.getElementById("a"+data.vo.roomId+"+"+data.vo.timeId);
//        	targetAObject.onclick="addFilm("+data.vo.roomId+","+data.vo.timeId+")";
        	targetAObject.setAttribute("onclick","addFilm("+data.vo.roomId+","+data.vo.timeId+")");
        	//修改图标
        	var targetIObject=document.getElementById("i"+data.vo.roomId+"+"+data.vo.timeId);
        	targetIObject.className="icon-plus-sign-alt";
        	
        	myid=data.vo.roomId+"+"+data.vo.timeId;
            var targetObject=document.getElementById(myid);
            targetObject.innerHTML="添加电影";
        }  
    });
}

function closeFilmToAdd(){
	$("#bbdId").remove();
	$('#window_mask').remove();
}

function ready_register(){
	$("#signupForm").validate({
		rules : {
			name : "required",
			password : {
				required : true,
				minlength : 5
			},
			confirm_password : {
				required : true,
				minlength : 5,
				equalTo : "#password"
			}
		},
		messages : {
			name : "请输入姓名",
			password : {
				required : "请输入密码",
				minlength : jQuery.format("密码不能小于{0}个字 符")
			},
			confirm_password : {
				required : "请输入确认密码",
				minlength : "确认密码不能小于5个字符",
				equalTo : "两次输入密码不一致不一致"
			}
		}
	});
}

function ready_recharge(){
		 $("#signupForm").validate({
		  rules: {
			  rechargeNum: {required:true,number:true}
		  },
		  messages: {
			  rechargeNum: {required:"必须输入一个金额",number:"请输入合法的数值"},
		  }
		 });
}

//积分兑换余额
function changeToMoney(){
	$.ajax({  
        url:"json/ajaxUserAction_changeToMoney.action",  
        type:"POST",  
        data: {},
        dataType:"json",  
        success:function(data){
        	if (data.message=="success"){
    			alert("兑换成功");
    			document.getElementById("money").innerHTML=data.money;
    			document.getElementById("score").innerHTML=data.score;
    		} else {
    			alert("data.message");
    		}
        }  
    });
}

//修改个人信息
function modifyInfo(){
	var selected=$("#sex").val();
	var sex;
	if (selected==0){
		sex="未选择";
	}
	if (selected==1){
		sex="男";
	}
	if (selected==2){
		sex="女"
	}
	$.ajax({  
        url:"json/ajaxUserAction_modifyInfo.action",  
        type:"POST",  
        data: {"name":$("#name").val(),"age":$("#age").val(),"place":$("#place").val(),"sex":sex},
        dataType:"json",  
        success:function(data){
        	if (data.message=="failure"){
    			alert("提交失败");
    		} else {
    			alert("提交成功");
    		}
        }  
    });
}

//取消资格
function cancelUser(){
	$.ajax({  
        url:"json/ajaxUserAction_cancelUser.action",  
        type:"POST",  
        data: {},
        dataType:"json",  
        success:function(data){
        	if (data.message=="success"){
    			alert("取消成功");
    			window.location.href="useraction_login.action";
    		} else {
    			alert("data.message");
    		}
        }  
    });
}