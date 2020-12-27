package com.springmvc.nhom09.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.nhom09.dao.DonHangDAO;

import com.springmvc.nhom09.model.DonHang;

@Repository
public class DonHangDAOImpl implements DonHangDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addDonHang(DonHang dc) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(dc);
	}

	@Override
	public List<DonHang> listDonHang() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<DonHang> donHangList = session.createNativeQuery("select * from DonHang", DonHang.class)
				.getResultList();
		return donHangList;
	}

	@Override
	public DonHang getDonHangById(String id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		DonHang p = (DonHang) session.find(DonHang.class, id);
		return p;
	}

	@Override
	public void removeDonHang(String id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		DonHang p = (DonHang) session.load(DonHang.class, id);
		if (null != p) {
			session.delete(p);
		}
	}

	@Override
	public void updateDonHang(DonHang dc) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(dc);
	}

}
