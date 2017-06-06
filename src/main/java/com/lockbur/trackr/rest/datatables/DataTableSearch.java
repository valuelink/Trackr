package com.lockbur.trackr.rest.datatables;

/**
 * dataTables 表格数据透视组件
 * Created by wangkun23 on 2016/11/10.
 */
public class DataTableSearch {
	private String value;
	private boolean regex;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isRegex() {
		return regex;
	}

	public void setRegex(boolean regex) {
		this.regex = regex;
	}

	@Override
	public String toString() {
		return "DataTableSearch{" +
				"value='" + value + '\'' +
				", regex=" + regex +
				'}';
	}
}
