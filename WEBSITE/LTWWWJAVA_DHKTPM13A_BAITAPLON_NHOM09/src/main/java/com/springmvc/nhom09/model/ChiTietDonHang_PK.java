package com.springmvc.nhom09.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class ChiTietDonHang_PK implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String donhang;
	private String dochoi;

	public ChiTietDonHang_PK(String donhang, String dochoi) {
		super();
		this.donhang = donhang;
		this.dochoi = dochoi;
	}


	public ChiTietDonHang_PK() {
		super();
		// TODO Auto-generated constructor stub
	}


	



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((dochoi == null) ? 0 : dochoi.hashCode());
		result = prime * result + ((donhang == null) ? 0 : donhang.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChiTietDonHang_PK other = (ChiTietDonHang_PK) obj;
		if (dochoi == null) {
			if (other.dochoi != null)
				return false;
		} else if (!dochoi.equals(other.dochoi))
			return false;
		if (donhang == null) {
			if (other.donhang != null)
				return false;
		} else if (!donhang.equals(other.donhang))
			return false;
		return true;
	}



	public String getDonhang() {
		return donhang;
	}


	public void setDonhang(String donhang) {
		this.donhang = donhang;
	}


	public String getDochoi() {
		return dochoi;
	}
	public void setDochoi(String dochoi) {
		this.dochoi = dochoi;
	}
	
}