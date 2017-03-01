package com.qdum.llhb.common.handler;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

public class UrlHandler extends Handler {

	enum Target{
	    evmadvisor,advisorcase,hazardouswastes,supplydemand,mall,entlib,quote,news,notice,infomaintain;
	    public static Target getTarget(String target) {
	    	Target v =null;
	    	try {
	    		v = valueOf(target);
			} catch (Exception e) {
			}
	        return v;  
	    }  
	}
	
	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		int navIndex=0;
		String reg="-|/";
		String t = target.replaceAll(reg, "").toLowerCase();
		
		reg="evmadvisor|advisorcase|hazardouswastes|supplydemand|mall|entlib|quote|news|notice|infomaintain";
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(t);
		t=m.find()?m.group():"";
		
		Target v = Target.getTarget(t);
		if(v!=null){
			switch (v) {
			case evmadvisor:
				navIndex=1;
				break;
			case advisorcase:
				navIndex=1;
				break;
			case hazardouswastes:
				navIndex=2;
				break;
			case supplydemand:
				navIndex=3;
				break;
			case mall:
				navIndex=4;
				break;
			case entlib:
				navIndex=5;
				break;
//			case quote:
//				navIndex=6;
//				break;
			case news:
				navIndex=6;
				break;
			case notice:
				navIndex=6;
				break;
			case infomaintain:
				navIndex=6;
				break;
			}
			request.setAttribute("navIndex", navIndex);
		}
		nextHandler.handle(target, request, response, isHandled);
	}
}
