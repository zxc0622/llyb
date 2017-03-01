<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
	<div class="Joedar_news Joedar_course">
		<p class="course"
			style="width: 42px; height: 200px; position: absolute; left: 0; background-color: green; color: #fff; text-align: center; line-height: 28px; padding-top: 25px; font-size: 18px;">
			公<br>司<br>发<br>展<br>历<br>程
		</p>
		<div class="Joedar_number">
			<p style="padding-top: 70px;">
				<img src="${ctxStatic}/img/v2/enterpriseCustom/number.png">
			</p>
			<p class="number_1" id="course1">${courseMsg[0].getStr('course_content')}</p>
			<p class="number_2" id="course2">${courseMsg[1].getStr('course_content')}</p>
			<p class="number_3" id="course3">${courseMsg[2].getStr('course_content')}</p>
			<p class="number_4" id="course4">${courseMsg[3].getStr('course_content')}</p>
			<p class="number_5" id="course5">${courseMsg[4].getStr('course_content')}</p>

		</div>
		<div class="zhe_z5"></div>
		<div class="box-bar6" style="display: none;">
			<a href="javascript:void(0);" title="设置" class="showbox6">设置</a> <a
				href="javascript:void(0);" title="删除" class="remove6">删除</a>
				<a href="javascript:void(0);" title="添加" class="addModule" style="width:80px">添加模块</a>
		</div>
		<div class="box6" style="display: none;">
			<h2>
				公司成长历程<a class="close"></a>
			</h2>
			<div class="mainlist">
				<h3></h3>
				<ul class="arrow_bg">
					<li class="on_bg">1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
				</ul>

				<div style="width: 544px; margin-top: 20px;">
					<input type="text" class="history" data-index='1' placeholder="历程详情1" maxlength="35">
					<input type="text" class="history" data-index='2' placeholder="历程详情2" maxlength="35">
					<input type="text" class="history" data-index='3' placeholder="历程详情3" maxlength="35">
					<input type="text" class="history" data-index='4' placeholder="历程详情4" maxlength="35">
					<input type="text" class="history" data-index='5' placeholder="历程详情5" maxlength="35">
					<p style="font-size: 11px;text-indent: 1em;color: #b5a9a9;">（每条历程最多输入35个字）</p>
				</div>

				<div style="width: 530px; padding: 20px 0 0 20px;">

					<div class="ensure">
						<a ><span id="box6_sure">确定</span></a>
						<a ><span class="abolish close">取消</span></a>
					</div>

				</div>
			</div>
		</div>

	</div>