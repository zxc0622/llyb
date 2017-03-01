//下边一行会报错
//window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
if(window!=top){
	window.parent.document.getElementById('rightIframe').height = 0;
}
/*直接跳转方法*/
/*function redirectTo(url){
    window.location.href=url;
}*/
function go(url){
    window.location.href=url;
}
/*iframe跳转方法*/
function ifmRedirctTo(url){

}
function back(){
    window.history.back(-1);
}

function goP(mName){
    window.parent.changeLeftMenu(mName);
}
function goUrl(url){
    window.parent.iframeGoToUrl(url);
}

/*回到顶部*/

$(document).ready(function(){
	$(".nav_totop").on("click",function(){
		$("html,body").animate({scrollTop:0});
	});
	if(window!=top){
		window.parent.document.getElementById('rightIframe').height = document.body.scrollHeight;
	}
});

var contentNavArr = [];
var ad_top=$(".header_banner_2").each(function(){
	contentNavArr.push($(this).offset().top);

});
/*滚动条事件*/
$(window).scroll(function(){
	/*左右悬窗定位*/
	if($(window).scrollTop() >contentNavArr[0]){
		$(".nav_bottomlist").show();
		$(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});


	}else if($(window).scrollTop() <=contentNavArr[0]){
		$(".nav_bottomlist").hide();
		$(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
	}
});
//$(".content").click(function(){
//	go('固废供求-副本-9-17.html');
//});

/**
 * 支持placeholder属性
 */
$(function(){
	var JPlaceHolder = {
            //检测
            _check : function(){
                return 'placeholder' in document.createElement('input');
            },
            //初始化
            init : function(){
                if(!this._check()){
                    this.fix();
                }
            },
            //修复
            fix : function(){
                jQuery(':input[placeholder]').each(function(index, element) {
                    var self = $(this), txt = self.attr('placeholder'),selffloat=self.css('float');
                    
                    self.wrap($('<div class="fixpalceholder"></div>').css({position:'relative', zoom:'1', border:'none', background:'none', padding:'none', margin:'none'}));
                    var pos = self.position(), h = self.outerHeight(true), paddingleft = (parseInt(self.css('padding-left'))+parseInt(self.css('text-indent')))+'px';
                    var holder = $('<span></span>').text(txt).css({position:'absolute', left:pos.left, top:pos.top, height:h, lienHeight:h, paddingLeft:paddingleft, color:'#aaa',background:'transparent'}).appendTo(self.parent());
                    self.focusin(function(e) {
                        holder.hide();
                    }).focusout(function(e) {
                        if(!self.val()){
                            holder.show();
                        }
                    });
                    holder.click(function(e) {
                        holder.hide();
                        self.focus();
                    });
                });
            }
        };
        //执行
        jQuery(function(){
            JPlaceHolder.init();
        });
});

function che(i){
    var p = "";
    switch (parseInt(i)){
        case 0:
            p = "请输入企业名称";
            break;
        case 1:
            p = "请输入环保需求信息";
            break;
        case 2:
            p = "请输入环保设备、原料、服务名称";
            break;
        case 3:
            p = "请输入资讯关键词";
            break;
    }
    $("#searchtext").attr("placeholder",p);
    $(".h_s_top a").eq(i).addClass("li-sel").siblings().removeClass("li-sel");
    $("#biaoji").val(i);
}

/*意见反馈*/
function advice(){
	this.boudingbox = $('<div class="populayer pl_index_view">'+
			    '<div class="layer_top">'+
			        '<a href="javascript:void(0)" class="close_btn">X</a>'+
			    '</div>'+
			    '<form id="suggestionForm" class="pl_view">'+
			        '<div class="per-row">'+
			        	'<p><span>*</span>留言内容</p>'+
			        	'<textarea name="suggestion.sugContent" id="content"></textarea>'+
			        '</div>'+
			        '<div class="per-row">'+
			        	'<p>与您联系</p>'+
			        	'<ul class="contact">'+
	                    	'<li><input class="need" type="radio" name="suggestion.needRelation" checked value="1">需要</li>'+
	                        '<li><input class="no_need" type="radio" name="suggestion.needRelation" value="0">不需要</li>'+
	                    '</ul>'+
			        '</div>'+
	                '<div class="per-row">'+
	                    '<p>联系人</p>'+
	                    '<input type="text" name="suggestion.relaUser">'+
	                '</div>'+
			        '<div class="need_no">'+
	                	'<div class="per-row">'+
			        		'<p>联系电话</p>'+
			        		'<input type="text" name="suggestion.relaPhone">'+
			        	'</div>'+
	                    '<div class="per-row">'+
			        		'<p>电子邮件</p>'+
			        		'<input type="text" name="suggestion.relaMail">'+
			        	'</div>'+
	                    '<div class="per-row">'+
			        		'<p>QQ</p>'+
			        		'<input type="text" name="suggestion.relaQQ">'+
			        	'</div>'+
	                '</div>'+
	                '<div class="per-row">'+
	                    '<p><span>*</span>验证码</p>'+
	                    '<input type="text" id="code" name="inputCode" style="width:100px;">'+
	                    '<a><img src="'+ ctx+'/servlet/validateCodeServlet?i="' + i + ' title="点击切换验证码" style="width:120px;height:30px;margin-left:30px;" onclick="getValidateCode(this);"/></a>'
                        +
	                '</div>'+
	                '<div class="per-row">'+
	                    '<p>&nbsp;</p>'+
	                    '<input type="button" id="submitForm" value="提交">'+
	                	'<input type="reset" value="重写">'+
	                '</div>'+
			    '</form>'+
			'</div>'+
			'<div class="popumask"></div>');
	this.render=function(){
		$("body").append(this.boudingbox);
		this.boudingbox.show();
	};
	this.destructor=function(){

	};
	this.destroy=function(){
		this.destructor();
        //解绑方法
        this.boudingbox.off();
        this.boudingbox.remove();
	};
	this.bindUI=function(){
		var that=this;
		this.boudingbox.on("click",".layer_top .close_btn",function(){
			that.destroy();
		});
		//绑定提交方法
        this.boudingbox.on("click","#submitForm",function(){
            if($("#content").val() == "") {
                alert("请填写留言内容!");
            }else if($("#code").val() == "") {
                alert("请填写验证码!");
            }else {
                var formData = $("#suggestionForm").serialize();
				//alert(formData);
                var url = getRootPath_dc()+"/suggest";
                //alert(url);
                $.post(url,formData,function(data){
                    if(data.isSuccess) {
                        alert("感谢您的反馈~");
						that.destroy();
                    }else {
                        alert(data.msg);
                    }
                },"json");
            }
        });
	};


	this.bindUI();
	this.render();
}

var i = 0;
//获取验证码
function getValidateCode(obj) {
    $(obj).attr("src","/servlet/validateCodeServlet?i="+i);
    i++;
}

function getRootPath_dc() {
    var pathName = window.location.pathname.substring(1);
    var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
    if (webName == "") {
        return window.location.protocol + '//' + window.location.host;
    }
    else {
        return window.location.protocol + '//' + window.location.host + '/' + webName;
    }
}

function postStandUrl(url,params){
    var turnForm = document.createElement("form");
    //一定要加入到body中！！
    document.body.appendChild(turnForm);
    turnForm.method = 'post';
    turnForm.action = url;
    turnForm.target = '';
    //创建隐藏表单
    for (var x in params) {
        var newElement = document.createElement("input");
        newElement.setAttribute("type","hidden");
        newElement.setAttribute("name",x);
        newElement.setAttribute("value",params[x]);
        //alert(newElement.name)
        turnForm.appendChild(newElement);
    }
    turnForm.submit();
}

