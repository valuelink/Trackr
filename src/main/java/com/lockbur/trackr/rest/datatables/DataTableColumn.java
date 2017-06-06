package com.lockbur.trackr.rest.datatables;

/**
 * dataTables 表格数据透视组件 列选择
 * Created by wangkun on 2016/11/10.
 */

public class DataTableColumn {
	private String name;
	private String data;
	private boolean searchable;
	private boolean orderable;
	private DataTableSearch search = new DataTableSearch();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public boolean isSearchable() {
		return searchable;
	}

	public void setSearchable(boolean searchable) {
		this.searchable = searchable;
	}

	public boolean isOrderable() {
		return orderable;
	}

	public void setOrderable(boolean orderable) {
		this.orderable = orderable;
	}

	public DataTableSearch getSearch() {
		return search;
	}

	public void setSearch(DataTableSearch search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "DataTableColumn{" +
				"name='" + name + '\'' +
				", data='" + data + '\'' +
				", searchable=" + searchable +
				", orderable=" + orderable +
				", search=" + search +
				'}';
	}
}
