package com.lockbur.trackr.rest.datatables;

import java.util.ArrayList;
import java.util.List;

/**
 * dataTables 表格数据透视组件
 * Created by Administrator on 2016/11/10.
 */
public class DataTableRequest {
	private int draw;
	private int start;
	private int length;
	private List<DataTableColumn> columns;
	private List<DataTableOrder> order;
	private DataTableSearch search;

	public DataTableRequest() {
		this.columns = new ArrayList<>();
		this.order = new ArrayList<>();
		this.search = new DataTableSearch();
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public List<DataTableColumn> getColumns() {
		return columns;
	}

	public void setColumns(List<DataTableColumn> columns) {
		this.columns = columns;
	}

	public List<DataTableOrder> getOrder() {
		return order;
	}

	public void setOrder(List<DataTableOrder> order) {
		this.order = order;
	}

	public DataTableSearch getSearch() {
		return search;
	}

	public void setSearch(DataTableSearch search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "DataTableParam{" +
				"draw=" + draw +
				", start=" + start +
				", length=" + length +
				", columns=" + columns +
				", order=" + order +
				", search=" + search +
				'}';
	}
}
