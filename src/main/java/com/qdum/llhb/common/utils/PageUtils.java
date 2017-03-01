package com.qdum.llhb.common.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.poi.ss.formula.functions.T;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("all")
public class PageUtils {

	private int pageNo = 1; // 当前页码
	private int pageSize = Integer.valueOf(10); // 页面大小，设置为“-1”表示不进行分页（分页无效）

	private long count;// 总记录数，设置为“-1”表示不查询总数

	private int first;// 首页索引
	private int last;// 尾页索引
	private int prev;// 上一页索引
	private int next;// 下一页索引

	private boolean firstPage;// 是否是第一页
	private boolean lastPage;// 是否是最后一页

	private int length = 8;// 显示页面长度
	private int slider = 1;// 前后显示页面长度

	private Map map; // 表单其他参数集合

	private List<T> list = new ArrayList<T>();

	private String orderBy = ""; // 标准查询有效， 实例： updatedate,name
	private String order = ""; 	 // asc

	private String funcName = "page"; // 设置点击页码调用的js函数名称，默认为page，在一页有多个分页对象时使用。

	/**
	 * 默认输出当前分页标签 <div class="page">${page}</div>
	 */
	public String toString() {
		StringBuilder sb = new StringBuilder();

		if (pageNo == first) {// 如果是首页
			sb.append("<li class='button_left'><a href=\"#\"></a></li>\n");
		} else {
			sb.append("<li ><a class='button_left ' onclick=\'page("+prev+","+pageSize+");\'></a></li>\n");
		}

		int begin = pageNo - (length / 2);

		if (begin < first) {
			begin = first;
		}

		int end = begin + length - 1;

		if (end >= last) {
			end = last;
			begin = end - length + 1;
			if (begin < first) {
				begin = first;
			}
		}

		if (begin > first) {
			int i = 0;
			for (i = first; i < first + slider && i < begin; i++) {
				sb.append("<li class='pages_li'><a class='li_one' href=\"javascript:" + funcName + "(" + i
						+ "," + pageSize + ");\">" + (i + 1 - first)
						+ "</a></li>\n");
			}
			if (i < begin) {
				sb.append("<li class='pages_li'><a class='li_one' href=\"javascript:void()\">...</a></li>\n");
			}
		}

		for (int i = begin; i <= end; i++) {
			if (i == pageNo) {
				sb.append("<li class='pages_li li_two'><a class='li_one li_shree'>" + (i + 1 - first)
						+ "</a></li>\n");
			} else {
				sb.append("<li class='pages_li'><a class='li_one' href=\"javascript:" + funcName + "(" + i
						+ "," + pageSize + ");\">" + (i + 1 - first)
						+ "</a></li>\n");
			}
		}

		if (last - end > slider) {
			sb.append("<li class='pages_li'><a href=\"javascript:void()\" >...</span></li>\n");
			end = last - slider;
		}

		for (int i = end + 1; i <= last; i++) {
			sb.append("<li class='pages_li'><a class='li_one' href=\"javascript:" + funcName + "(" + i + ","
					+ pageSize + ");\">" + (i + 1 - first) + "</a></li>\n");
		}

		if (pageNo == last) {
			sb.append("<li class='button_right'><a class='li_one'></a></li>\n");
		} else {
			sb.append("<li ><a class='button_right' onclick=\'page("+next+","+pageSize+");\'></a></li>\n");
		}

		sb.append("<li class=\"out_pages_dian\">跳转到</li>"
				+ "<li><input type=\"text\" onkeyup=\"this.value=this.value.replace(/[^\\d]/g,'')\" class=\"out_pages_kuang\" /></li>");
		
		sb.append("<li class=\"pages_li\"><a class=\"li_one\" href=\"javascript:"+ funcName+"($(\'.out_pages_kuang\').val(),"+pageSize+");\" >GO</a></li>");
        
		sb.insert(0, "<ul class=\"pages\">\n").append("</ul>\n");

		sb.append("<div style=\"clear:both;\"></div>");

		String string = sb.toString();

		return string;
	}

	public String getPageNoSelect() {
		String pageNoSelect = "<select name=\"pageNoSelect\" onchange=\""
				+ funcName
				+ "(this.value,"
				+ pageSize
				+ ");"
				+ "\"  style=\"padding: 4px 12px;width: 60px;padding: 0;margin: -3px 0 0 0;text-align: center;height: 20px;\" >";
		for (int i = 1; i <= this.getLast(); i++) {
			if (this.getPageNo() == i) {
				pageNoSelect = pageNoSelect + "<option value=\"" + i
						+ "\" selected >" + i + "</option>";
			} else {
				pageNoSelect = pageNoSelect + "<option value=\"" + i + "\" >"
						+ i + "</option>";
			}
		}

		pageNoSelect = pageNoSelect + "</select>";
		return pageNoSelect;
	}

	public String getPageSizeSelect() {
		String pageSizeSelect = "<select name=\"pageSizeSelect\" onchange=\""
				+ funcName
				+ "(1,this.value);"
				+ "\" style=\"padding: 4px 12px;width: 60px;padding: 0;margin: -3px 0 0 0;text-align: center;height: 20px;\" >";
		if (this.getPageSize() == 10) {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"10\" selected >10</option>";
		} else {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"10\"  >10</option>";
		}

		if (this.getPageSize() == 20) {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"20\" selected >20</option>";
		} else {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"20\"  >20</option>";
		}

		if (this.getPageSize() == 30) {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"30\" selected >30</option>";
		} else {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"30\"  >30</option>";
		}

		if (this.getPageSize() == 50) {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"50\" selected >50</option>";
		} else {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"50\"  >50</option>";
		}

		if (this.getPageSize() == 100) {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"100\" selected >100</option>";
		} else {
			pageSizeSelect = pageSizeSelect
					+ "<option value=\"100\"  >100</option>";
		}

		pageSizeSelect = pageSizeSelect + "</select>";
		return pageSizeSelect;
	}

	/**
	 * 初始化参数
	 */
	public void initialize(Page page) {

		pageNo = page.getPageNumber();
		count = page.getTotalRow();
		pageSize = page.getPageSize();
		list = page.getList();
		first = 1;
		last = page.getTotalPage() == 0 ? 1 : page.getTotalPage();
		prev = pageNo - 1;
		next = pageNo + 1;
		if (pageNo == 1) {
			firstPage = true;
		} else {
			firstPage = false;
		}
		if (pageNo == last) {
			lastPage = true;
		} else {
            lastPage = false;
		}

	}
	
	/**
	 * 获取设置总数
	 * 
	 * @return
	 */
	public long getCount() {
		return count;
	}

	/**
	 * 设置数据总数
	 * 
	 * @param count
	 */
	public void setCount(long count) {
		this.count = count;
		if (pageSize >= count) {
			pageNo = 1;
		}
	}

	/**
	 * 获取当前页码
	 * 
	 * @return
	 */
	public int getPageNo() {
		if (pageNo <= 0) {
			pageNo = 1;
		}
		return pageNo;
	}

	/**
	 * 设置当前页码
	 * 
	 * @param pageNo
	 */
	public void setPageNo(int pageNo) {
		if (pageNo<=0) {
			this.pageNo = pageNo;
		} else {
			this.pageNo = pageNo;
		}
	}

	/**
	 * 获取页面大小
	 * 
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 设置页面大小（最大500）
	 * 
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize <= 0 ? 10 : pageSize > 500 ? 500 : pageSize;
	}
	
	/**
	 * 首页索引
	 * 
	 * @return
	 */
	public int getFirst() {
		return first;
	}

	/**
	 * 尾页索引
	 * 
	 * @return
	 */
	public int getLast() {
		return last;
	}

	/**
	 * 获取页面总数
	 * 
	 * @return getLast();
	 */
	public int getTotalPage() {
		return getLast();
	}

	/**
	 * 是否为第一页
	 * 
	 * @return
	 */
	public boolean isFirstPage() {
		return firstPage;
	}

	/**
	 * 是否为最后一页
	 * 
	 * @return
	 */
	public boolean isLastPage() {
		return lastPage;
	}

	/**
	 * 上一页索引值
	 * 
	 * @return
	 */
	public int getPrev() {
		if (isFirstPage()) {
			return pageNo;
		} else {
			return pageNo - 1;
		}
	}

	/**
	 * 下一页索引值
	 * 
	 * @return
	 */
	public int getNext() {
		if (isLastPage()) {
			return pageNo;
		} else {
			return pageNo + 1;
		}
	}

	/**
	 * 获取本页数据对象列表
	 * 
	 * @return List<T>
	 */
	public List<T> getList() {
		return list;
	}

	/**
	 * 设置本页数据对象列表
	 * 
	 * @param list
	 */
	public void setList(List<T> list) {
		this.list = list;
	}

	/**
	 * 获取查询排序字符串
	 * 
	 * @return
	 */
	public String getOrderBy() {
		return orderBy;
	}

	/**
	 * 获取查询排序字符串
	 * 
	 * @return
	 */
	public String getOrderBySql() {
		if (orderBy.trim().equals("")) {
			return "";
		} else {
			return " order by " + orderBy;
		}
	}
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	/**
	 * 设置查询排序，标准查询有效， 实例： updatedate desc, name asc
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	/**
	 * 获取点击页码调用的js函数名称 function ${page.funcName}(pageNo){location=
	 * "${ctx}/list-${category.id}${urlSuffix}?pageNo="+i;}
	 * 
	 * @return
	 */
	public String getFuncName() {
		return funcName;
	}

	/**
	 * 设置点击页码调用的js函数名称，默认为page，在一页有多个分页对象时使用。
	 * 
	 * @param funcName
	 *            默认为page
	 */
	public void setFuncName(String funcName) {
		this.funcName = funcName;
	}

	/**
	 * 分页是否有效
	 * 
	 * @return this.pageSize==-1
	 */
	public boolean isDisabled() {
		return this.pageSize == -1;
	}

	/**
	 * 是否进行总数统计
	 * 
	 * @return this.count==-1
	 */
	public boolean isNotCount() {
		return this.count == -1;
	}

	/**
	 * 获取 Hibernate FirstResult
	 */
	public int getFirstResult() {
		int firstResult = (getPageNo() - 1) * getPageSize();
		if (firstResult >= getCount()) {
			firstResult = 0;
		}
		return firstResult;
	}

	/**
	 * 获取 Hibernate MaxResults
	 */
	public int getMaxResults() {
		return getPageSize();
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}
}