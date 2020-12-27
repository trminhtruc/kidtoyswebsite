package com.springmvc.nhom09.service;

import java.util.List;

import com.springmvc.nhom09.model.ChiTietDonHang;


public interface ChiTietDonHangService {
	public void addChiTietDonHang(ChiTietDonHang dc);

	public List<ChiTietDonHang> listChiTiet();

	public ChiTietDonHang getChiTietDonHangById(String id);

//	public void removeDonHang(String id);

	public void updateChiTietDonHang(ChiTietDonHang dc);
}
