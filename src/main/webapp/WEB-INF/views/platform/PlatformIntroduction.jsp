<%@ page language="java" contentType="text/html;charset=utf-8"
pageEncoding="utf-8"%> 
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" href="" />
<title>平台介绍</title>
<meta name="keywords" content="优蚁环保—国家环保服务业试点，中国领先的环保行业一站式服务平台" />
<meta name="description" content="优蚁环保网是一站式互联网+环保综合服务平台，致力于帮助生产型企业寻找优质环保公司，提供企业环保顾问咨询，第三方环保监理，让企业高效省心的处理环保问题。">
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/common.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/index.css" />
<link type="text/css" rel="stylesheet"
	href="${ctxStatic}/css/llhb/xinxiguanli_v1.css" />
<script type="text/javascript"
	src="${ctxStatic}/js/llhb/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/index.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/llhb/eye_scroll.js"></script>
<link rel="shortcut icon" href="${ctxStatic}/img/llhb/bitbug_favicon.ico"/>
<style>
/*头部中部start*/
.header_banner{margin-top:15px;}
/*头部中部end*/
/*内容start*/

/*当前位置*/
.main_row_1 {
	height: 40px;
	overflow: hidden;
	margin-bottom: 10px;
}

.cur_position {
	font-size: 12px;
	color: #666;
	margin: 15px 0;
	float: left;
}

.main_row_1 .btn_1 {
	width: 110px;
	height: 30px;
	line-height: 30px;
	background-color: #ee7800;
	float: right;
	margin-top: 10px;
	margin-left: 10px;
	position: relative;
	cursor: pointer;
}

.main_row_1 .btn_1 a {
	color: #FFF;
	margin-left: 10px;
}

.main_con {
	padding: 0 20px;
	overflow: hidden;
}

.web_nav {
	overflow: hidden;
}

.web_nav_1 {
	margin-top: 24px;
	width: 296px;
	float: left;
	margin-right: 20px;
}

.web_nav_tit {
	color: #333;
	padding-bottom: 12px;
	border-bottom: 1px solid #ccc;
	display: block;
}

.web_nav_1 dl {
	padding: 20px 10px 0 0;
	border-bottom: 1px dashed #ccc;
}

.web_nav_1 dl dt {
	font-weight: bolder;
}

.web_nav_1 dl dd {
	margin-left: 8px;
	height: 50px;
}

.web_nav_1 dl dt::before {
	content: "";
	width: 3px;
	height: 3px;
	border-radius: 3px;
	background-color: #666;
	float: left;
	margin-top: 10px;
	margin-right: 5px
}

.web_nav_1 dl:hover {
	color: #5EC520;
}

.web_nav_1 dl:hover dt::before {
	background-color: #5EC520;
}

.ser_trems {
	overflow: hidden;
}

.ser_trems p {
	width: 946px;
	border: 1px solid #e5e5e5;
	background-color: #f7f8f8;
	line-height: 30px;
	padding-left: 10px;
	margin: 20px 0 10px 0;
}

.ser_trems h2 {
	font-weight: normal;
	line-height: 22px;
	padding: 0 30px;
	text-indent: 20px;
}

.ser_trems h3 {
	font-weight: normal;
	line-height: 22px;
	padding: 0 30px;
}

.ser_trems ul {
	padding: 0 30px;
	text-indent: 20px;
}
</style>
</head>
<body>

	<!-- 引入头部 -->
	<%@ include file="/WEB-INF/views/include/header_v2.jsp"%>

	<!--中间部分start-->
	<div class="wrapper">
		<div class="main">
			<div class="main_row_1">
				<div class="cur_position">当前位置>优蚁网>首页>平台介绍</div>
			</div>
			<div class="tab_main"
				style="width: 998px; overflow: hidden; margin-bottom: 100px;">
				<div class="m_r_title">
					<span class="m_r_tname">网站导航</span> <span>平台特点</span> <span>服务条款</span>
					<span>法律声明</span>
				</div>
				<div class="main_con">
					<form class="web_nav" action="">
						<div class="web_nav_1">
							<a class="web_nav_tit font_3">企业服务</a>
							<!-- <dl class="font_1 color_1" onclick="hrefHome(1)">
								<dt>发布固废供应</dt>
								<dd>发布您的废旧物资供应信息，让生意自动找上门</dd>
							</dl>
							<dl class="font_1 color_1" onclick="hrefHome(2)">
								<dt>发布固废求购</dt>
								<dd>发布您的废旧物资收购需求，让再生资源不断利用</dd>
							</dl> -->
							<dl class="font_1 color_1" onclick="hrefHome(3)">
								<dt>企业库</dt>
								<dd>加入最大、最专业的环保行业公司名录，让人随时都找到</dd>
							</dl>
							<dl class="font_1 color_1" onclick="hrefHome(4)">
								<dt>环保商城</dt>
								<dd>汇集环保专业设备、环保服务企业、 专业环保工程建设与运营商家，快速精准匹配环保需求</dd>
							</dl>
							<dl class="font_1 color_1" style="border-bottom: 0px;" onclick="hrefHome(5)">
								<dt>环保报价</dt>
								<dd>全国独创的环评、监测报价系统，只需用户提供项目信息，平台十秒反馈参考报价</dd>
							</dl>
						</div>
						<div class="web_nav_1" >
							<a class="web_nav_tit font_3">优蚁VIP服务</a>
							<dl class="font_1 color_1" onclick="hrefHome(6)">
								<dt>资质认证</dt>
								<dd>免费环保行业权威认证核实，获得优蚁VIP专属标志</dd>
							</dl>
							<dl class="font_1 color_1" onclick="hrefHome(7)">
								<dt>全网营销</dt>
								<dd>旺铺+独立网站+手机网站+微网站营销，四网融合全新渠道</dd>
							</dl>
							<dl class="font_1 color_1">
								<dt>搜索排名</dt>
								<dd>产品搜索固定排名展示，迅速提高产品曝光量</dd>
							</dl>
							<dl class="font_1 color_1">
								<dt>黄金铺位</dt>
								<dd>以个性化大图片，高曝光度以及固定位置长周期的形式进行推广</dd>
							</dl>
							<dl class="font_1 color_1" style="border-bottom: 0px;" onclick="hrefHome(8)">
								<dt>优蚁广告</dt>
								<dd>广告位轮播推广，活动优先，展示优先，提高企业知名度</dd>
							</dl>
						</div>
						<div class="web_nav_1">
							<a class="web_nav_tit font_3">帮助中心</a>
							<dl class="font_1 color_1" onclick="hrefHome(9)">
								<dt>自助服务</dt>
								<dd>自助学习环保知识、高效快捷解决问题</dd>
							</dl>
							<dl class="font_1 color_1" onclick="hrefHome(10)">
								<dt>在线客服</dt>
								<dd>专业服务，在线咨询，无需等待</dd>
							</dl>
							<dl class="font_1 color_1" onclick="hrefHome(11)">
								<dt>客服热线</dt>
								<dd>免费客服电话，环保专家等候垂询</dd>
							</dl>
						</div>
					</form>
					<form class="ser_trems" action="">
						<h1 class="color_1"
							style="font-size: 30px; font-weight: normal; height: 56px; line-height: 30px; margin-top: 30px; width: 958px; text-align: center;">优蚁环保平台服务协议</h1>
						<p class="font_3 color_1">1、接收条款</p>
						<h2 class="color_1 font_1">欢迎使用优蚁环保网（www.yyhb365.com）会员服务，以下所述条款和条件即构成您与优蚁环保就使用服务所达成的协议且您受本条款的条件约束，本条款的所有解释权归优蚁环保所有，一旦您使用了该服务，即表示您已接受了以下所述的条款和条件。如果您不同意接受全部的条款和条件，那么您将无权使用该服务。</h2>
						<p class="font_3 color_1">2、会员服务</p>
						<h3 class="color_1 font_1">2.1 您购买的本服务，包含以下功能(下述功能随时可能因优蚁环保网的单方判断而被增加或修改，或因定期、不定期的维护而暂缓提供，您将会得到相应的变更通知)</h3>
						<h3 class="color_1 font_1">2.1.1 企业身份认证：</h3>
						<ul class="color_1 font_1">
							<li>● 登记的公司在实际经营所在地工商部门是否有合法有效的注册记录</li>
							<li>● 您所登记的联系人在本公司的身份是否属实</li>
							<li>● 您所登记的联系人是否获得公司授权购买和使用会员服务</li>
						</ul>
						<h3 class="color_1 font_1">2.1.2 发布网络信息：</h3>
						<h2 class="color_1 font_1">即由优蚁环保平台提供空间，会员可自行张贴其商业信息，包括其文字描述、图片或照片说明。会员应对其发布的全部信息承担相应法律责任。如优蚁环保平台因会员发布信息而承担了法律责任，优蚁环保及其相应的权利义务承担主体可向会员追偿。</h2>
						<h3 class="color_1 font_1">2.1.3 查阅网站信息：</h3>
						<h2 class="color_1 font_1">查阅或订阅优蚁环保网站的信息：
							即会员有权通过访问优蚁环保网查看或订阅其他会员在优蚁环保发布的各类信息，但优蚁环保不对该信息的真实性、准确性或完整性和及时性负责。您同意自行承担由于使用会员服务所获知信息而产生的全部商业风险。优蚁环保确认会员服务的上述功能构成本协议所述服务的主要部分，该服务未得到会员的同意前不会全部终止或全部变更。</h2>
						<h3 class="color_1 font_1">2.1.4 证书荣誉展示：</h3>
						<h2 class="color_1 font_1">即由优蚁环保提供空间，会员可自行展示各类证书、资格或荣誉。会员应对该等资料的真实性、有效性负责。</h2>
						<h3 class="color_1 font_1">2.2
							在优蚁环保收到您的付款及您已被确认通过企业身份认证后，您将成为会员。优蚁环保将通过您在注册时提供的电子邮件地址通知您，您的帐户将自即日起生效。</h3>
						<h3 class="color_1 font_1">2.3
							如您所提供的资料有误、资料变更或其他原因导致未获认证人认证的，您可以在修改资料后要求再次认证，再次认证的费用及相关服务费由您自行承担。</h3>
						<h3 class="color_1 font_1">2.4
							优蚁环保根据您注册时的帐号和其密码确认使用服务的会员身份。您应妥善保管帐号和密码，并对其使用包括遗失承担责任。您承诺，其密码和帐号遭到未获授权的使用，或者发生其他任何安全问题时，将立即通知优蚁环保。会员在此同意并确认，优蚁环保对由于上述情况所产生的遗失或损害不负责任。</h3>
						<h3 class="color_1 font_1">2.5
							在服务期满前，如会员希望变更已获认证和查证的信息，则任何变更均需在变更发生之日起一个月内按要求向优蚁环保平台提交"信息变更的再次认证申请"并付清相关费用后，将得到认证人的再次认证。会员同意对所提供变更后的信息负全部责任，并同意按照本协议程序付款。如您未及时变更、未付清款项，或所变更信息未经认证人认证，则优蚁环保有权暂缓或终止向您提供服务，或暂缓、终止您的帐号。</h3>
						<h3 class="color_1 font_1">2.6
							对会员使用服务所提供的任何信息的真实性、准确性、及时性和完整性不作保证和承诺。此外，企业身份的认证和查证仅表明认证及查证当时的情况，对此后的变更，优蚁环保网不作任何承诺和保证。</h3>
						<h3 class="color_1 font_1">2.7
							优蚁环保保留在任何时候自行决定对服务及其相关功能、应用软件变更、升级、修改、转移的权利。优蚁环保进一步保留在服务中开发新的模块、功能和软件或其它服务的权利。上述所有新的模块、功能、软件服务的提供，除非优蚁环保另有说明，否则仍适用本服务协议。</h3>
						<h3 class="color_1 font_1">2.8
							会员同意仅与第三方进行商务沟通、联络的目的而使用优蚁环保的服务。会员在此同意优蚁环保在任何情况下都无需向会员或第三方在使用服务时对其在传输或联络中的迟延、不准确、错误或疏漏及因此而致使的损害负责。</h3>
						<p class="font_3 color_1">3、危废服务条款</p>
						<h3 class="color_1 font_1">3.1危废服务为收费服务。用户点击申请危废服务并付款后，双方的危废服务合同关系成立并生效。</h3>
						<h3 class="color_1 font_1">3.2危废服务合同生效后，优蚁环保将为用户提供危废办理工作，包括提供合同模板、在线签订合同等。用户需确保提供的资料真实有效，因用户提供的资料不真实而造成的损失，由用户自行承担，与优蚁环保无关。</h3>
						<h3 class="color_1 font_1">3.3用户中途解除合同需经优蚁环保同意，同意解除合同的，优蚁环保按提供的服务进度比例收取费用，剩余的款项将退给用户。</h3>
						<p class="font_3 color_1">4、危废服务条款</p>
						<h3 class="color_1 font_1">4.1环保报价服务为免费服务。优蚁环保提供的报价系基于市场情况及历史分析作出的市场平均价，该报价仅供参考，不构成优蚁环保及其合作方的任何要约，最终的价格以提供环保服务的公司报价为准。</h3>
						<h3 class="color_1 font_1">4.2系统报价后会针对项目推荐相关的环保公司供用户挑选，但用户需与环保公司签订正式的合同后才产生相关的法律约束力。</h3>
						<p class="font_3 color_1">5、服务期限</p>
						<h3 class="color_1 font_1">5.1
							会员服务有效期一年，自帐户生效日起算。凡购买会员服务，其期限不得少于一年。</h3>
						<h3 class="color_1 font_1">5.2
							若优蚁环保在服务期满之日前未收到会员全部的续订款，则其会员的服务将不需事先通知而被立即终止。</h3>
						<p class="font_3 color_1">6、续签</p>
						<h3 class="color_1 font_1">6.1会员购买优蚁环保服务满一年，可于服务协议届满前一个月向优蚁环保提出续签会员服务申请。</h3>
						<h3 class="color_1 font_1">6.2
							续签的会员须在本协议届满之日前，向优蚁环保全额支付下一年度服务费，并须重新进行企业身份认证。</h3>
						<h3 class="color_1 font_1">6.3续签的会员通过企业身份认证后，本协议自上一年度届满之日起自动延续一年。</h3>
						<h3 class="color_1 font_1">6.4续签的会员如未通过企业身份认证，按本协议2.3款执行。</h3>
						<p class="font_3 color_1">7、服务费</p>
						<h3 class="color_1 font_1">7.1
							所有的费用将通过电汇或其它优蚁环保接受的方式事先支付。会员所支付的可以是人民币，或其它经优蚁环保许可的货币。您应在购买优蚁环保服务的当天，按上述方式向优蚁环保支付全部款项。</h3>
						<h3 class="color_1 font_1">7.2
							上述服务费不包含其它任何税款、费用或相关邮寄、转账等支出，否则会员应补足付款或自行支付该费用。</h3>
						<h3 class="color_1 font_1">7.3
							优蚁环保保留随时单方修改价格和支付条件的权利，并至少提前通知会员。</h3>
						<h3 class="color_1 font_1">7.4
							会员在服务开通到期满续约之前，不受在此期间优蚁环保调整服务价格的影响。</h3>
						<p class="font_3 color_1">8、会员义务</p>
						<h3 class="color_1 font_1">8.1会员在此声明、保证并同意：</h3>
						<ul class="color_1 font_1">
							<li>● 提供真实、准确、及时、完整的信息；</li>
							<li>●
								维护并及时更新上述资料，以保证其真实、准确、及时和完整性，会员在此授予优蚁环保永久的、不可撤销的、全球的和免费的使用许可权，包括其代理人、雇员、服务提供商和其他提供必要技术和服务的合作人(包括但不限于认证人)，其有权使用会员根据本协议所述而提供的资料和信息。会员进一步同意其一旦将信息或资料在使用服务时提供，则表示同意放弃对此信息或资料所享有的版权和相关财产权利。如果会员提供的信息不真实、不准确、不及时或不完全，或优蚁环保有合理的理由怀疑其真实性、准确性、及时性和完整性，则优蚁环保有权中止或终止会员资格并拒绝会员使用任何现有的服务及以后可能提供的功能或服务，并追究因此而产生的损失。</li>
						</ul>
						<h3 class="color_1 font_1">8.2 会员在此声明并保证所提供的信息和产品不应包含以下内容：</h3>
						<ul class="color_1 font_1">
							<li>● 欺诈、提供虚假要约、销售或试图销售假冒伪劣及盗窃的物品以及其它法律法规限制或禁止销售及推广的物品；</li>
							<li>● 侵犯或教唆他人侵犯第三方的版权、专利、商业秘密或其它合法权利；</li>
							<li>● 违反相关法律、法规、规章或决定(包括但不限于国家出口限制、消费者保护、不正当竞争和歧视或虚假广告) ；</li>
							<li>● 含有侮辱、诽谤、恐吓或非法骚扰等内容；</li>
							<li>● 含有淫秽色情内容；</li>
							<li>● 含有种族、性别、地区、民族、生理残疾等歧视性或倾向性内容；</li>
							<li>●
								含有蓄意毁坏、恶意干扰、秘密地截取或侵占任何系统、数据或个人资料的任何病毒、伪装破坏程序、电脑蠕虫、定时程序炸弹或其它电脑程序。</li>
						</ul>
						<h3 class="color_1 font_1">8.3会员根据本协议使用服务所发布的任何信息或提供的任何资料都必须符合优蚁环保网站当时及此后公示的发布须知及相关文字说明。</h3>
						<h3 class="color_1 font_1">8.4会员同意仅为与第三方进行真实的商务沟通、联络的目的而使用优蚁环保的服务，同意不以各种形式从事信息代理、中介等，否则，优蚁环保有权随时终止服务并不予退返服务费。优蚁环保平台保留追究违约会员相关责任的权利。</h3>
						<h3 class="color_1 font_1">8.5会员同意并接受优蚁环保实时监控会员通过服务所提供的信息资料内容，并针对上述事项进行编辑调整。优蚁环保对会员提供的资料、信息和评述不作确认、检验或其它任何形式的保证。每一个会员都必须单独地为其通信内容的合法性负责，并对其提供的资料、信息或评述负全部责任。同时，优蚁环保保留删除依据其自行判断确认具有违法性或违反优蚁环保会员服务协议而可能致使优蚁环保因此承担责任的任何内容。会员进一步同意，优蚁环保没有义务，也不应对会员或第三方所张贴提供的任何资料的真实性、准确性、是否构成误导、欺诈、诽谤、侵权或违法负责。如会员因此而遭受损失，则应由会员自行向张贴人要求赔偿，会员放弃追究优蚁环保责任的权利。</h3>
						<h3 class="color_1 font_1">8.6
							根据本协议或优蚁环保的其它许可，会员有权使用优蚁环保提供的数据库和列表等技术服务。除此以外，其它使用或试图使用优蚁环保的各种目录、数据库和列表用作商业性目的或复制、抄袭、进行大规模促销(包括但不限于发送垃圾邮件等)和其它未经许可的目的，将被强行禁止。</h3>
						<p class="font_3 color_1">9、有限责任</p>
						<h3 class="color_1 font_1">9.1
							服务将按“现状”和按“可得到”的状态提供。优蚁环保在此明确声明对服务不作任何明示或暗示的保证，包括但不限于对服务的可适用性、没有错误或疏漏、持续性、准确性、可靠性、适用于某一特定用途之类的保证、声明或承诺。优蚁环保对服务所涉的技术和信息的有效性、准确性、正确性、可靠性、质量、稳定、完整和及时性均不作承诺和保证。</h3>
						<h3 class="color_1 font_1">9.2
							使用本服务获取任何资料的行为均出于会员的独立判断并自行承担风险。每一个会员独自承担因此对其电脑系统或资料灭失造成的损失。优蚁环保对会员的任何通知，不论是口头还是书面的，均不表示做出在本协议陈述以外的任何担保责任。</h3>
						<h3 class="color_1 font_1">9.3
							不论在何种情况下，优蚁环保均不对由于Internet连接故障、电脑、通讯或其他系统的故障、电力故障、罢工、劳动争议、暴乱、起义、骚乱、生产力或生产资料不足、火灾、洪水、风暴、爆炸、战争、政府行为、国际国内法院的命令或第三方的不作为而造成的不能服务或延迟服务承担责任。</h3>
						<h3 class="color_1 font_1">9.4
							每一个会员均同意赔偿由于使用本服务(包括但不限于将用户资料展示在网站上)或违反本协议而给优蚁环保造成的任何损失(包括由此产生的全额的诉讼费用和律师费)。每一个会员均同意优蚁环保不对任何其他人张贴的资料，包括诽谤性的、攻击性的或非法的资料，承担任何的责任;由于此类材料对其它用户造成的损失由用户自行全部承担。</h3>
						<h3 class="color_1 font_1">9.5 优蚁环保声明，对于平台上没有经过认证的企业，提供的信息仅供参考，不保证其信息的真实性、完整性。客户要购买这些企业的服务需自己核实相关信息，与之交易发生的一切纠纷须由用户自行全部承担。</h3>
						<p class="font_3 color_1">10、服务的终止</p>
						<h3 class="color_1 font_1">10.1 优蚁环保有权在下列情形下拒绝您的会员资格：</h3>
						<ul class="font_1 color_1">
							<li>● 您违反了本协议的任一条款；</li>
							<li>● 优蚁环保或其授权的第三方无法确认您提供的相关信息；</li>
							<li>● 如果服务开通之后发现会员是网络服务提供商，那么优蚁环保有权中止服务。</li>
						</ul>
						<h3 class="color_1 font_1">10.2
							如协议一方，除为重组或兼并的目的外，通过决议或由法院判令解散，则接收方或指定的债权人代表有权经通知后终止本协议。</h3>
						<h3 class="color_1 font_1">10.3协议期内，在会员被第三方多次投诉等合理情形下，为避免优蚁环保其他会员及优蚁环保的损失，有权以电子邮件或其他书面形式通知会员后解除本合同，本合同自优蚁环保网发出解除通知时终止。合同解除后，会员可凭优蚁环保就本合同开具的收据原件及退款申请就退还未履行部分的合同价款与优蚁环保进行协商。</h3>
						<p class="font_3 color_1">11、赔偿</p>
						<h2 class="color_1 font_1">您同意，如因您违反本协议或经在此提及而纳入本协议的其他文件，或因您违反法律侵害了第三方的合法权利，或因您违反法律须承担行政或刑事责任，而使第三方或行政、司法机关对优蚁环保及关联公司、董事、职员、代理人提出索赔或处罚要求(包括司法费用和其他专业人士的费用)，您必须全额赔偿给优蚁环保及关联公司、董事、职员、代理人，并使其等免遭损失。</h2>
						<p class="font_3 color_1">12、广告服务</p>
						<h2 class="color_1 font_1">您在广告栏与刊登广告人士通讯或进行业务往来或参与其推广活动，以及与该等业务往来相关的任何其他条款、条件、保证或声明，仅限于在您和该刊登广告人士之间发生。您同意，对于因任何该等业务往来或因该等刊登广告人士而发生的任何种类的任何损失或损毁，优蚁环保无需负责或承担任何责任。您如打算通过广告所示内容创设或参与与任何公司、股票行情、投资或证券有关的任何服务，或收取或要求与任何公司、股票行情、投资或证券有关的任何新闻信息、警戒性信息或其他资料，敬请注意，优蚁环保不会就通过网站传送的任何该等资料的准确性、有用性或可用性、可获利性负责或承担任何责任，且不会对根据该等资料而作出的任何交易或投资决策负责或承担任何责任。</h2>
						<p class="font_3 color_1">13、第三方链接</p>
						<h2 class="color_1 font_1">提供与第三方网站的链接仅仅为了给您带来方便。如果您使用这些链接，将离开优蚁环保网站点。优蚁环保没有审查过所有这些第三方站点，对任何这些站点及其内容或它们的保密政策不进行控制，也不负任何责任。因此，我们对这些网站上的任何信息、软件以及其它产品或材料，或者通过使用它们可能获得的任何结果不予认可，也不作任何表述。如果您决定访问本站点链接的任何第三方站点，其风险完全由您自己承担。</h2>
						<p class="font_3 color_1">14、通知</p>
						<h2 class="color_1 font_1">您应当准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以便优蚁环保或其他用户与您进行有效联系，因通过这些联系方式无法与您取得联系，导致您在使用优蚁环保服务过程中产生任何损失或增加费用的，应由您完全独自承担。您了解并同意，您有义务保持你提供的联系方式的有效性，如有变更需要更新的，您应按优蚁环保的要求进行操作。</h2>
						<p class="font_3 color_1">15、论坛言论和其他内容</p>
						<h2 class="color_1 font_1">优蚁环保会员可以在优蚁环保平台论坛张贴评论、意见及其他内容，以及提出建议、主意、意见、问题或其他信息，只要内容不是非法、淫秽、威胁、诽谤、侵犯隐私、侵犯知识产权或以其他形式对第三者构成伤害或侵犯或令公众讨厌，也不包含软件病毒、政治宣传、商业招揽、连锁信、大宗邮件或任何形式的“垃圾邮件”。优蚁环保网站保留清除或编辑这些内容的权利（但非义务），但不对所张贴的内容进行经常性的审查。</h2>
						<h2 class="color_1 font_1">如果您确实张贴了内容或提交了材料，除非我们有相反指示，您授予优蚁环保非排他的、免费的、永久的、不可撤销的和完全的再许可权而在全世界范围内任何媒体上使用、复制、修改、改写、出版、翻译、创作衍生作品、分发和展示这样的内容。您授予优蚁环保和被转许可人使用您所提交的与这些内容有关的名字的权利，如果他们选择这样做的话。您声明并担保您拥有或以其它方式控制您所张贴内容的权利，内容是准确的，对您所提供内容的使用不违反本政策并不会对任何人和实体造成伤害。您声明并保证对于因您所提供的内容引起的对优蚁环保的损害进行赔偿。优蚁环保有权（但非义务）监控和编辑或清除任何活动或内容。优蚁环保对您或任何第三方所张贴的内容不承担责任。</h2>
						<p class="font_3 color_1">16、知识产权</p>
						<h2 class="color_1 font_1">优蚁环保是本协议所有权利的拥有者。服务包含商业秘密、全世界范围内的版权和其它知识产权。服务的全部权利，包括所有权和知识产权将由优蚁环保保留。其它本协议中未经提及的权利亦由优蚁环保保留。优蚁环保平台相关的标识和徵记是禁止未经授权地复制、模仿、使用或发布。
						</h2>
						<p class="font_3 color_1">17、适用法律及管辖</p>
						<h2 class="color_1 font_1">本条款适用于中国法律并依照中国法律解释，不会造成任何法律的冲突。任何因有关使用本站而发生的诉讼均应提交优蚁环保公司住所地的人民法院。如果您还有疑问，您可以直接给我们客服中心留言。
						</h2>
					</form>
					<form class="ser_trems" action="">
						<h1 class="color_1"
							style="font-size: 30px; font-weight: normal; height: 56px; line-height: 30px; margin-top: 30px; width: 958px; text-align: center;">法律声明</h1>
						<p class="font_3 color_1">免责条款</p>
						<h2 class="color_1 font_1">欢迎使用优蚁环保！任何使用优蚁环保的用户均应仔细阅读本声明，用户必须不加修改地完全接受本协议中所包含的条款、条件和优蚁环保网站即时刊登的通告，并且遵守有关互联网及/或本网站的相关法律、规定与规则。用户使用优蚁环保的行为，包括进入优蚁环保主页及各层页面将被视为对本声明全部内容的认可。</h2>
						<h2 class="color_1 font_1">优蚁环保网站上所有刊登内容，以及所提供的信息资料，目的是为了更好地服务我们的访问者，本网站不保证所有信息、文本、图形、链接及其它
							项目的绝对准确性和完整性，故仅供访问者参照使用。</h2>
						<h2 class="color_1 font_1">优蚁环保不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不做担保。对于因不可抗力或优蚁环保不能控制的原因造成的网络服务中断或其他缺陷，优蚁环保不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</h2>
						<h2 class="color_1 font_1">任何单位或个人认为优蚁环保的内容（或通过优蚁环保到的第三方内容）可能涉嫌侵犯其合法权益，应该及时向优蚁环保书面反馈，并提供身份证明、权属证明及详细侵权情况证明，优蚁环保在收到上述法律文件经核实后，将尽快删除被控侵权内容。</h2>
						<h2 class="color_1 font_1">除优蚁环保注明之服务条款外，其它因使用优蚁环保网站而引致之任何意外、疏忽、合约毁坏、诽谤、版权或知识产权侵犯及其所造成的各种损失
							（包括因下载而感染电脑病毒），优蚁环保概不负责，亦不承担任何法律责任。</h2>
						<h2 class="color_1 font_1">任何透过优蚁环保网页而链接及得到之资讯、产品及服务，优蚁环保概不负责，亦不负任何法律责任。</h2>
						<h2 class="color_1 font_1">优蚁环保内所有内容并不反映任何优蚁环保之意见及观点。</h2>
						<h2 class="color_1 font_1">优蚁环保适用于中华人民共和国法律法规规定的其它有关免责规定。</h2>
						<h2 class="color_1 font_1">欢迎使用优蚁环保网（www.yyhb365.com）会员服务，以下所述条款和条件即构成您与优蚁环保就使用服务所达成的协议且您受本条款的条件约束，本条款的所有解释权归优蚁环保所有，一旦您使用了该服务，即表示您已接受了以下所述的条款和条件。如果您不同意接受全部的条款和条件，那么您将无权使用该服务。</h2>
						<p class="font_3 color_1">隐私声明</p>
						<h2 class="color_1 font_1">尊重用户个人隐私是优蚁环保的一项基本政策，我们以本隐私声明对访问者做出隐私保护的许诺。在同意优蚁环保网服务协议之时，您已经同意我们按照本隐私声明来使用和披露您的个人信息。本隐私声明的全部条款属于服务协议的一部份。</h2>
						<h3 class="color_1 font_1">1、收集个人信息</h3>
						<h2 class="color_1 font_1">当您在注册为会员时，我们要求您的注册信息。这些信息可能包括您的真实姓名、公司名称、企业类型、公司所在地、电子邮箱、电话号码、传真号码等。我们通过注册信息来获得会员的统计资料。我们将会用这些统计数据来给我们的会员分类，以便有针对性地向我们的会员提供新的服务和机会。我们会通过您的邮件地址来通知您这些新的服务和机会。</h2>
						<h3 class="color_1 font_1">2、个人信息保护</h3>
						<h2 class="color_1 font_1">优蚁环保网严格保护您个人信息的安全。我们使用各种安全技术和程序来保护您的个人信息不被未经授权的访问、使用或泄露。</h2>
						<h2 class="color_1 font_1">优蚁环保网会在法律要求或符合优蚁环保的相关服务条款、软件许可使用协议约定的情况下透露您的个人信息，或者有充分理由相信必须这样做才能：(a)
							满足法律或行政法规的明文规定，或者符合优蚁环保网站适用的法律程序；（b）符合优蚁环保网相关服务条款、软件许可使用协议的约定；(c)
							保护优蚁环保网的权利或财产；(d) 在紧急情况下保护优蚁环保网员工、产品或服务的用户或大众的个人安全。</h2>
						<h2 class="color_1 font_1">您同意我们利用您的个人信息与您联络，并向您提供您感兴趣的信息，如：产品信息。您接受"服务协议"和本隐私声明即为明示同意收取这些资料。</h2>
						<h2 class="color_1 font_1">我们的网站公布了用户提交的商业机会和报价，而其他用户可以查询这些报价和商业机会。</h2>

						<h3 class="color_1 font_1">3、Cookie的使用</h3>
						<h2 class="color_1 font_1">Cookie的使用cookies是少量的数据，在您未拒绝接受cookies的情况下，cookies将被发送到您的浏览器，并储存在您的计算机硬盘。我们使用cookies储存您访问我们网站的相关数据，在您访问或再次访问我们的网站时,我们能识别您的身份，并通过分析数据为您提供更好更多的服务。</h2>
						<h2 class="color_1 font_1">您有权选择接受或拒绝接受cookies。您可以通过修改浏览器的设置以拒绝接受cookies，但是我们需要提醒您，因为您拒绝接受cookies，您可能无法使用依赖于cookies的我们网站的部分功能。</h2>
						<p class="font_3 color_1">版权声明</p>
						<h2 class="color_1 font_1">广东绿联互联网科技有限公司（以下简称"绿联公司"）拥有优蚁环保网站（网址）内所有资料的版权。</h2>
						<h2 class="color_1 font_1">绿联公司对其发行的或与合作公司共同发行的包括但不限于产品或服务的全部内容及优蚁环保网站上的材料拥有版权等知识产权受法律保护。未经本公司书面许可，任何单位及个人不得以任何方式或理由对上述产品、服务、信息、材料的任何部分进行使用、复制、修改、抄录、传播或与其它产品捆绑使用、销售。</h2>
						<h2 class="color_1 font_1">凡侵犯本公司版权等知识产权的，本公司必依法追究其法律责任。</h2>
						<p class="font_3 color_1">商标声明</p>
						<h2 class="color_1 font_1">"优蚁环保"、"优蚁环保yyhb365.com"、"yyhb.com"和优蚁环保LOGO商标或标识均为绿联公司享有的商品及服务商标和商号。未经本公司或商标权利人书面许可，任何单位及个人不得以任何方式或理由对该商标的任何部分进行使用、复制、修改、传播、抄录或与其它产品捆绑使用销售。</h2>
						<h2 class="color_1 font_1">凡侵犯本公司商标权的，我公司必依法追究其法律责任。</h2>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--中间部分end-->

<!-- 引入尾部 -->
<%@ include file="/WEB-INF/views/include/footer_v2.jsp"%>


<%@ include file="/WEB-INF/views/include/rightLine.jsp"%>
	<script>
$(document).ready(function(){
	$(".ser_trems").hide();
	var num_1;
    if('${numm}'==2){
        $(".tab_main .m_r_title span").removeClass("m_r_tname").eq(2).addClass("m_r_tname");
        $(".web_nav").hide();
        $(".ser_trems").hide();
        $(".ser_trems:first").show();
    }
	$(".tab_main .m_r_title span").mousedown(function(){

		num_1=$(".tab_main .m_r_title span").index(this);
		$(".tab_main .m_r_title span").removeClass("m_r_tname");
		$(this).addClass("m_r_tname");
		if(num_1==0){
			$(".web_nav").show();
			$(".ser_trems").hide();		
		}else if(num_1==1){
			window.location.href="${ctx}/platform/indexIconInit";
		}else if(num_1==2){
			$(".web_nav").hide();
			$(".ser_trems").hide();
			$(".ser_trems:first").show();		
		}else if(num_1==3){
			$(".web_nav").hide();
			$(".ser_trems").hide();
			$(".ser_trems:last").show();		
		}
	})
})
</script>

	<script>
$(function(){
	$(".h_s_top a").on("click",function(){
		$(this).addClass("li-sel").siblings().removeClass("li-sel");
		$("#biaoji").val($(this).index());
	});
	h_s_bottom_a();
	
	var contentNavArr = [];
	var ad_top=$(".header_banner").each(function(){
	  contentNavArr.push($(this).offset().top);
	});
	/*滚动条事件*/
	$(window).scroll(function(){
	  /*左右悬窗定位*/
	  if($(window).scrollTop() >　contentNavArr[0]){
		  $(".nav_bottomlist").show();
		  $(".gf_ad_left,.gf_ad_right").css({position:"fixed",top:"95px"});
	  }else if($(window).scrollTop() <=　contentNavArr[0]){
		  $(".nav_bottomlist").hide();
		  $(".gf_ad_left,.gf_ad_right").css({position:"absolute", top:"311px"});
	  }
	});
});

	function h_s_bottom_a(){
		var total_width=0;
		$(".h_s_bottom a").each(function(){
		total_width+=$(this).width();
		if(parseInt(total_width)>350){
			$(this).hide();
		}
		});
	}

	function hrefHome(obj){
		if(obj==1){
			window.open('${ctx}/supply-demand');
		}else if(obj==2){
			window.open('${ctx}/supply-demand');
		}else if(obj==3){
			window.open('${ctx}/EntLib');
		}else if(obj==4){
			window.open('${ctx}/mall');
		}else if(obj==5){
			window.open('${ctx}/quote');
		}else if(obj==6){
			window.open('${ctx}/home?str=/perinfo/authService');
		}else if(obj==7){
			window.open('${ctx}/platform/indexIconInit');
		}else if(obj==8){
			window.open('${ctx}/home?str=/ypcd/adsManage/adsAdd'); 
		}else if(obj==9){
			window.open('${ctx}/platform/helpCenter?flag=1');
		}else if(obj==10){
			window.open("http://crm2.qq.com/page/portalpage/wpa.php?uin=4009609288&aty=0&a=0&curl=&ty=1&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no");
		}else if(obj==11){
		 	window.open('${ctx}/platform/helpCenter?flag=3'); 
		}
	}
</script>

</body>
</html>


