package com.springmvc.nhom09.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({ @NamedQuery(name = "getListDoChoi", query = "select dc from DoChoi dc") })
public class DoChoi implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String maDoChoi;
	private String tenDoChoi;
	private String moTa;
	private String hinhAnhURL;
	private double giatien;
	private String tinhTrang;
	private int soLuong;
	@OneToMany(mappedBy = "dochoi", fetch = FetchType.EAGER)
	List<ChiTietDonHang> chitietdonhang;

	@ManyToOne
	@JoinColumn(name = "maDanhMuc")
	private DanhMuc danhmuc;

	public DoChoi(String maDoChoi, String tenDoChoi, String tinhTrang, String moTa, String hinhAnhURL, double giatien,
			int soLuong) {
		super();
		this.tinhTrang = tinhTrang;
		this.maDoChoi = maDoChoi;
		this.tenDoChoi = tenDoChoi;
		this.moTa = moTa;
		this.hinhAnhURL = hinhAnhURL;
		this.giatien = giatien;
		this.soLuong = soLuong;

	}

	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public DanhMuc getDanhmuc() {
		return danhmuc;
	}

	public String getTenDoChoi() {
		return tenDoChoi;
	}

	public void setTenDoChoi(String tenDoChoi) {
		this.tenDoChoi = tenDoChoi;
	}

	public void setDanhmuc(DanhMuc danhmuc) {
		this.danhmuc = danhmuc;
	}

	public DoChoi() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMaDoChoi() {
		return maDoChoi;
	}

	public void setMaDoChoi(String maDoChoi) {
		this.maDoChoi = maDoChoi;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getHinhAnhURL() {
		return hinhAnhURL;
	}

	public void setHinhAnhURL(String hinhAnhURL) {
		this.hinhAnhURL = hinhAnhURL;
	}

	public double getGiatien() {
		return giatien;
	}

	public void setGiatien(double giatien) {
		this.giatien = giatien;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	@Override
	public String toString() {
		return "DoChoi [maDoChoi=" + maDoChoi + ", moTa=" + moTa + ", hinhAnhURL=" + hinhAnhURL + ", giatien=" + giatien
				+ ", soLuong=" + soLuong + ", chitietdonhang=" + chitietdonhang + "]";
	}

}
