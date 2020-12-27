package com.springmvc.nhom09.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.nhom09.dao.DonHangDAO;
import com.springmvc.nhom09.model.DonHang;
import com.springmvc.nhom09.service.DonHangService;

@Service
public class DonHangServiceImpl implements DonHangService {
	private DonHangDAO donHangDAO;

	public void setDonHangDAO(DonHangDAO donHangDAO) {
		this.donHangDAO = donHangDAO;
	}

	@Override
	@Transactional
	public void addDonHang(DonHang dc) {
		// TODO Auto-generated method stub
		this.donHangDAO.addDonHang(dc);
	}

	@Override
	@Transactional
	public List<DonHang> listDonHang() {
		// TODO Auto-generated method stub
		return this.donHangDAO.listDonHang();
	}

	@Override
	@Transactional
	public DonHang getDonHangById(String id) {
		// TODO Auto-generated method stub
		return this.donHangDAO.getDonHangById(id);
	}

	@Override
	@Transactional
	public void removeDonHang(String id) {
		// TODO Auto-generated method stub
		this.donHangDAO.removeDonHang(id);
	}

	@Override
	@Transactional
	public void updateDonHang(DonHang dc) {
		// TODO Auto-generated method stub
		this.donHangDAO.updateDonHang(dc);
	}

}
