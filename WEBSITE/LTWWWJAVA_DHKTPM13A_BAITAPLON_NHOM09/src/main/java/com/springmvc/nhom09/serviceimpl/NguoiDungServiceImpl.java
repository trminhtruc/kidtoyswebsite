package com.springmvc.nhom09.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.springmvc.nhom09.dao.NguoiDungDAO;
import com.springmvc.nhom09.model.NguoiDung;
import com.springmvc.nhom09.service.NguoiDungService;

@Service
public class NguoiDungServiceImpl implements NguoiDungService{

	private NguoiDungDAO nguoiDungDAO;

	
	public void setNguoiDungDAO(NguoiDungDAO nguoiDungDAO) {
		this.nguoiDungDAO = nguoiDungDAO;
	}

	
	@Override
	@Transactional
	public void addNguoiDung(NguoiDung dc) {
		this.nguoiDungDAO.addNguoiDung(dc);
		
	}

	@Override
	@Transactional
	public List<NguoiDung> listNguoiDung() {
		// TODO Auto-generated method stub
		return this.nguoiDungDAO.listNguoiDung();
	}

	@Override
	@Transactional
	public NguoiDung getNguoiDungById(String id) {
		// TODO Auto-generated method stub
		return this.nguoiDungDAO.getNguoiDungById(id);
	}

	@Override
	@Transactional
	public void removeNguoiDung(String id) {
		// TODO Auto-generated method stub
		this.nguoiDungDAO.removeNguoiDung(id);
	}

	@Override
	@Transactional
	public void updateNguoiDung(NguoiDung dc) {
		// TODO Auto-generated method stub
		this.nguoiDungDAO.updateNguoiDung(dc);
	}
	
}
