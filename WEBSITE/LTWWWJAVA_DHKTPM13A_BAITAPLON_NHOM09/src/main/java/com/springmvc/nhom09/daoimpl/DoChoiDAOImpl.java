package com.springmvc.nhom09.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.springmvc.nhom09.dao.DoChoiDAO;
import com.springmvc.nhom09.model.DoChoi;

@Repository
public class DoChoiDAOImpl implements DoChoiDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public void addDoChoi(DoChoi dc) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(dc);
	}

	@SuppressWarnings("unchecked")
	public List<DoChoi> listDoChoi() {
		Session session = this.sessionFactory.getCurrentSession();
		List<DoChoi> doChoiList = session.createNamedQuery("getListDoChoi").list();
		return doChoiList;
	}

	@Override
	public DoChoi getDoChoiById(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		DoChoi p = (DoChoi) session.find(DoChoi.class, id);
		return p;
	}

	@Override
	public void removeDoChoi(DoChoi dc) {
		Session session = this.sessionFactory.getCurrentSession();

		session.delete(dc);

		// logger.info("Person deleted successfully, person details="+p);
	}

	@Override
	public void updateDoChoi(DoChoi dc) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(dc);
	}

}