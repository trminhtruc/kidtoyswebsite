package com.springmvc.nhom09.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.nhom09.dao.NguoiDungDAO;

import com.springmvc.nhom09.model.NguoiDung;

@Repository
public class NguoiDungDAOImpl implements NguoiDungDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addNguoiDung(NguoiDung dc) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(dc);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NguoiDung> listNguoiDung() {
		Session session = this.sessionFactory.getCurrentSession();
		List<NguoiDung> nguoiDunglist = session.createNamedQuery("getAllKhachHang").list();
		return nguoiDunglist;
	}

	@Override
	public NguoiDung getNguoiDungById(String id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		NguoiDung p = (NguoiDung) session.find(NguoiDung.class, id);
		return p;
	}

	@Override
	public void removeNguoiDung(String id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		NguoiDung p = (NguoiDung) session.load(NguoiDung.class, id);
		if (null != p) {
			session.delete(p);
		}
	}

	@Override
	public void updateNguoiDung(NguoiDung dc) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(dc);
	}

}
