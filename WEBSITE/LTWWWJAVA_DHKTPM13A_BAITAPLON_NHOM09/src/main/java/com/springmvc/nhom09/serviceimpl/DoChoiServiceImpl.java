package com.springmvc.nhom09.serviceimpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.nhom09.dao.DoChoiDAO;
import com.springmvc.nhom09.model.DoChoi;
import com.springmvc.nhom09.service.DoChoiService;

@Service
public class DoChoiServiceImpl implements DoChoiService {
	private DoChoiDAO doChoiDAO;

	public void setDoChoiDAO(DoChoiDAO doChoiDAO) {
		this.doChoiDAO = doChoiDAO;
	}

	@Transactional
	public void addDoChoi(DoChoi dc) {
		this.doChoiDAO.addDoChoi(dc);
	}

	@Transactional
	public List<DoChoi> listDoChoi() {
		return this.doChoiDAO.listDoChoi();
	}

	@Override
	@Transactional
	public DoChoi getDoChoiById(String id) {
		// TODO Auto-generated method stub
		return this.doChoiDAO.getDoChoiById(id);
	}

	@Override
	@Transactional
	public void removeDoChoi(DoChoi dc) {
		// TODO Auto-generated method stub
		this.doChoiDAO.removeDoChoi(dc);
	}

	@Override
	@Transactional
	public void updateDoChoi(DoChoi dc) {
		// TODO Auto-generated method stub
		this.doChoiDAO.updateDoChoi(dc);
	}

}
