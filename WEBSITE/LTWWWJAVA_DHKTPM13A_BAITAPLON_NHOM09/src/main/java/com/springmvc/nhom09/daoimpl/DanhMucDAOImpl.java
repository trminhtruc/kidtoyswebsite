package com.springmvc.nhom09.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.nhom09.dao.DanhMucDAO;
import com.springmvc.nhom09.model.DanhMuc;


@Repository
public class DanhMucDAOImpl implements DanhMucDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addDanhMuc(DanhMuc dc) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(dc);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DanhMuc> listDanhMuc() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<DanhMuc> danhmucList = session.createNamedQuery("getListDanhMuc").list();
		return danhmucList;
	}

	@Override
	public DanhMuc getDanhMucById(String id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		DanhMuc p = (DanhMuc) session.find(DanhMuc.class, id);
		return p;
	}

	@Override
	public void removeDanhMuc(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		DanhMuc p = (DanhMuc) session.load(DanhMuc.class, id);
		if (null != p) {
			session.delete(p);
		}

	}

	@Override
	public void updateDanhMuc(DanhMuc dc) {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		session.update(dc);
	}

}
