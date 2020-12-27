package com.springmvc.nhom09.dao;

import java.util.List;

import com.springmvc.nhom09.model.DanhMuc;


public interface DanhMucDAO {
	public void addDanhMuc(DanhMuc dc);
	public List<DanhMuc> listDanhMuc();
	public DanhMuc getDanhMucById(String id);
	public void removeDanhMuc(String id) ;
	public void updateDanhMuc(DanhMuc dc);
}
