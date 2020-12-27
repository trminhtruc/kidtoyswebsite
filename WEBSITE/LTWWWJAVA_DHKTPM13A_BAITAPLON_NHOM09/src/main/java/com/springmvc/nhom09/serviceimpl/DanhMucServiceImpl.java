package com.springmvc.nhom09.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.nhom09.dao.DanhMucDAO;
import com.springmvc.nhom09.model.DanhMuc;
import com.springmvc.nhom09.service.DanhMucService;

@Service
public class DanhMucServiceImpl implements DanhMucService {
	private DanhMucDAO danhMucDAO;

	public void setDanhMucDAO(DanhMucDAO danhMucDAO) {
		this.danhMucDAO = danhMucDAO;
	}

	@Override
	@Transactional
	public void addDanhMuc(DanhMuc dc) {
		// TODO Auto-generated method stub
		this.danhMucDAO.addDanhMuc(dc);
	}

	@Override
	@Transactional
	public List<DanhMuc> listDanhMuc() {
		// TODO Auto-generated method stub
		return this.danhMucDAO.listDanhMuc();
	}

	@Override
	@Transactional
	public DanhMuc getDanhMucById(String id) {
		// TODO Auto-generated method stub
		return this.danhMucDAO.getDanhMucById(id);
	}

	@Override
	@Transactional
	public void removeDanhMuc(String id) {
		// TODO Auto-generated method stub
		this.danhMucDAO.removeDanhMuc(id);
	}

	@Override
	@Transactional
	public void updateDanhMuc(DanhMuc dc) {
		// TODO Auto-generated method stub
		this.danhMucDAO.updateDanhMuc(dc);
	}

}
