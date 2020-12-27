package com.springmvc.nhom09.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity
@IdClass(ChiTietDonHang_PK.class)
public class ChiTietDonHang implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@ManyToOne 
	@JoinColumn(name = "maDonHang",referencedColumnName = "maDonHang")
	private DonHang donhang;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "maDoChoi",referencedColumnName = "maDoChoi")
	private DoChoi dochoi;
	private double donGia;
	private int soLuong;
	public ChiTietDonHang(DonHang donhang, DoChoi dochoi, double donGia, int soLuong) {
		super();
		this.donhang = donhang;
		this.dochoi = dochoi;
		this.donGia = donGia;
		this.soLuong = soLuong;
	}
	public ChiTietDonHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DonHang getDonHang() {
		return donhang;
	}
	public void setDonHang(DonHang donHang) {
		this.donhang = donHang;
	}
	public DoChoi getDoChoi() {
		return dochoi;
	}
	public void setDoChoi(DoChoi doChoi) {
		this.dochoi = doChoi;
	}
	public double getDonGia() {
		return donGia;
	}
	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
	
}
