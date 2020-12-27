package com.springmvc.nhom09.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.nhom09.dao.ChiTietDonHangDAO;

import com.springmvc.nhom09.model.ChiTietDonHang;

import com.springmvc.nhom09.service.ChiTietDonHangService;

@Service
public class ChiTietDonHangServiceImpl implements ChiTietDonHangService {
	private ChiTietDonHangDAO chiTietDonHangDAO;

	public void setChiTietDonHangDAO(ChiTietDonHangDAO chiTietDonHangDAO) {
		this.chiTietDonHangDAO = chiTietDonHangDAO;
	}

	@Override
	@Transactional
	public void addChiTietDonHang(ChiTietDonHang dc) {
		// TODO Auto-generated method stub
		this.chiTietDonHangDAO.addChiTiet(dc);
	}

	@Override
	@Transactional
	public List<ChiTietDonHang> listChiTiet() {
		// TODO Auto-generated method stub
		return this.chiTietDonHangDAO.listChiTietDonHang();
	}

	@Override
	@Transactional
	public ChiTietDonHang getChiTietDonHangById(String id) {
		// TODO Auto-generated method stub
		return this.chiTietDonHangDAO.getChiTietcById(id);
	}

	@Override
	@Transactional
	public void updateChiTietDonHang(ChiTietDonHang dc) {
		// TODO Auto-generated method stub
		this.chiTietDonHangDAO.updateChiTiet(dc);
	}

}
