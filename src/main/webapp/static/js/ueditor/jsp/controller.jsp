<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.baidu.ueditor.ActionEnter"
    pageEncoding="UTF-8"%>
<%@ page import="com.jfinal.ext.weixin.kit.PropKit" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );

	String myRootPath  = rootPath;
	myRootPath = PropKit.get("uploadDir");

	out.write( new ActionEnter( request,myRootPath, rootPath ).exec() );
	
%>