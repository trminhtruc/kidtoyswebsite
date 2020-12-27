package com.springmvc.nhom09.service;

import java.util.List;


import com.springmvc.nhom09.model.DonHang;

public interface DonHangService {
	public void addDonHang(DonHang dc);

	public List<DonHang> listDonHang();

	public DonHang getDonHangById(String id);

	public void removeDonHang(String id);

	public void updateDonHang(DonHang dc);
}
