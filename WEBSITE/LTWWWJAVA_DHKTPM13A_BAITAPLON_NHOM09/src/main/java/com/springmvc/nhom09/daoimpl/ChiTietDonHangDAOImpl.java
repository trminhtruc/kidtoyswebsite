package com.springmvc.nhom09.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.nhom09.dao.ChiTietDonHangDAO;
import com.springmvc.nhom09.model.ChiTietDonHang;

@Repository
public class ChiTietDonHangDAOImpl implements ChiTietDonHangDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addChiTiet(ChiTietDonHang dc) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(dc);
	}

	@Override
	public List<ChiTietDonHang> listChiTietDonHang() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<ChiTietDonHang> donHangchitietList = session
				.createNativeQuery("select * from ChiTietDonHang", ChiTietDonHang.class).getResultList();
		return donHangchitietList;
	}

	@Override
	public ChiTietDonHang getChiTietcById(String id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		ChiTietDonHang p = (ChiTietDonHang) session.find(ChiTietDonHang.class, id);
		return p;
	}

	@Override
	public void updateChiTiet(ChiTietDonHang dc) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(dc);
	}
}
