package com.lockbur.trackr.rest.datatables;
/**
 * dataTables 表格数据透视组件 排序
 * Created by wangkun on 2016/11/10.
 */
public class DataTableOrder {
	private int column;
	private String dir;

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    @Override
    public String toString() {
        return "DataTableOrder{" +
                "column=" + column +
                ", dir='" + dir + '\'' +
                '}';
    }
}
