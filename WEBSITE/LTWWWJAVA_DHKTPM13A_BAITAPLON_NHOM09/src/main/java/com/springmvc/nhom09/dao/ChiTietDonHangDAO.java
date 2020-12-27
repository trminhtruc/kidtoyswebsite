package com.springmvc.nhom09.dao;

import java.util.List;

import com.springmvc.nhom09.model.ChiTietDonHang;


public interface ChiTietDonHangDAO {
	public void addChiTiet(ChiTietDonHang dc);

	public List<ChiTietDonHang> listChiTietDonHang();

	public ChiTietDonHang getChiTietcById(String id);

//	public void removeDanhMuc(String id) ;
	public void updateChiTiet(ChiTietDonHang dc);
}
