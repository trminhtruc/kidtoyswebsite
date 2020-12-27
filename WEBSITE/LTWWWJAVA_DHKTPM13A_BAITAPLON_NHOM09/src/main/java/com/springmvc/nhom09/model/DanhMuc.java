package com.springmvc.nhom09.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 * @author DoanKimDinh
 *
 */
@Entity
@NamedQueries({ @NamedQuery(name = "getListDanhMuc", query = "select dm from DanhMuc dm") })
public class DanhMuc implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String maDanhMuc;
	private String tenDanhMuc;

	@OneToMany(mappedBy = "danhmuc", fetch = FetchType.EAGER)
	private List<DoChoi> dochoi;

	public DanhMuc(String maDanhMuc, String tenDanhMuc) {
		super();
		this.maDanhMuc = maDanhMuc;
		this.tenDanhMuc = tenDanhMuc;
	}

	public DanhMuc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMaDanhMuc() {
		return maDanhMuc;
	}

	public void setMaDanhMuc(String maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	public String getTenDanhMuc() {
		return tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	public List<DoChoi> getDochoi() {
		return dochoi;
	}

	public void setDochoi(List<DoChoi> dochoi) {
		this.dochoi = dochoi;
	}

	@Override
	public String toString() {
		return "DanhMuc [maDanhMuc=" + maDanhMuc + ", tenDanhMuc=" + tenDanhMuc + ", dochoi=" + dochoi + "]";
	}

}
