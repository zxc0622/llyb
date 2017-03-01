package com.qdum.llhb.sys.utils;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jfinal.plugin.ehcache.CacheKit;
import com.qdum.llhb.sys.model.Dict;

public class DictUtils {
	private static final String SYS_CACHE = "sysCache";
	public static final String CACHE_DICT_MAP = "dictMap";
	
	public static String getDictLabel(String value, String type, String defaultValue) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
            List<Dict> list = getDictList(type);
            if (null == list) {
                return defaultValue;
            }else{
                for (Dict dict : getDictList(type)) {
                    if (type.equals(dict.getType()) && value.equals(dict.getValue())) {
                        return dict.getLabel();
                    }
                }
            }
		}
		return defaultValue;
	}

	public static String getDictValue(String label, String type, String defaultLabel) {
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)) {
			for (Dict dict : getDictList(type)) {
				if (type.equals(dict.getType()) && label.equals(dict.getLabel())) {
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}
	
	public static List<Dict> getDictList(String type) {
		Map<String, List<Dict>> dictMap = CacheKit.get(SYS_CACHE,CACHE_DICT_MAP);
		if (dictMap == null) {
			dictMap = Maps.newHashMap();
			for (Dict dict : Dict.dao.findAllList()) {
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null) {
					dictList.add(dict);
				} else {
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
			CacheKit.put(SYS_CACHE,CACHE_DICT_MAP, dictMap);
		}
		List<Dict> dictList = Lists.newArrayList();
        dictList = dictMap.get(type);
		return dictList;
	}
    public static String delHTMLTag(String htmlStr){
        String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式
        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式
        String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式
        String regEx_space="&nbsp;";

        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
        Matcher m_script=p_script.matcher(htmlStr);
        htmlStr=m_script.replaceAll(""); //过滤script标签

        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);
        Matcher m_style=p_style.matcher(htmlStr);
        htmlStr=m_style.replaceAll(""); //过滤style标签

        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
        Matcher m_html=p_html.matcher(htmlStr);
        htmlStr=m_html.replaceAll(""); //过滤html标签

        Pattern p_space=Pattern.compile(regEx_space,Pattern.CASE_INSENSITIVE);
        Matcher m_space=p_space.matcher(htmlStr);
        htmlStr = m_space.replaceAll(""); //过滤html标签
        return htmlStr.trim(); //返回文本字符串
    }
}
