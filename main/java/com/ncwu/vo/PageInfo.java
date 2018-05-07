package com.ncwu.vo;

import java.util.List;

/**
 * 分页展示的封装
 * @author yblh0
 *
 */
public class PageInfo<T> {

	/**
	 * 当前页码
	 */
	private int pageNumber;
	
	/**
	 * 总页数
	 */
	private int pageCount;
	
	/**
	 * 当前页数据
	 */
	private List<T> data;

	public PageInfo() {
		super();
	}

	public PageInfo(int pageNumber, int pageCount, List<T> data) {
		super();
		this.pageNumber = pageNumber;
		this.pageCount = pageCount;
		this.data = data;
	}

	@Override
	public String toString() {
		return "PageInfo [pageNumber=" + pageNumber + ", pageCount=" + pageCount + ", data=" + data + "]";
	}

	public int getpageNumber() {
		return pageNumber;
	}

	public void setpageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}
}
