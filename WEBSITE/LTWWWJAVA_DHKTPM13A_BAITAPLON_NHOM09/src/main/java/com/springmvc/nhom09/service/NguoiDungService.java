package com.springmvc.nhom09.service;

import java.util.List;

import com.springmvc.nhom09.model.NguoiDung;

public interface NguoiDungService {
	public void addNguoiDung(NguoiDung dc);

	public List<NguoiDung> listNguoiDung();

	public NguoiDung getNguoiDungById(String id);

	public void removeNguoiDung(String id);

	public void updateNguoiDung(NguoiDung dc);
}
