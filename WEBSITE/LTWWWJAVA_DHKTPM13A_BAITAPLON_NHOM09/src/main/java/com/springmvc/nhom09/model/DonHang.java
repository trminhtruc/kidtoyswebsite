package com.springmvc.nhom09.model;

import java.io.Serializable;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({@NamedQuery(name = "getListDonHang",query = "select dh from DonHang dh")})
public class DonHang implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String maDonHang;
	private String diaChi;
	private LocalDateTime ngayLap;
	private String tinhTrang;

	@OneToMany(mappedBy = "donhang",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private List<ChiTietDonHang> chitietdonhang;

	@ManyToOne
	@JoinColumn(name = "maNguoiDung")
	private NguoiDung nguoidung;
	
	public DonHang() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(String tinhTrang) {
		this.tinhTrang = tinhTrang;
	}

	public DonHang(String maDonHang, String diaChi, LocalDateTime ngayLap,NguoiDung kh) {
		super();
		this.maDonHang = maDonHang;
		this.diaChi = diaChi;
		this.ngayLap = ngayLap;
		this.nguoidung = kh;
	}
	
	public NguoiDung getKhachhang() {
		return nguoidung;
	}

	public void setKhachhang(NguoiDung khachhang) {
		this.nguoidung = khachhang;
	}

	public List<ChiTietDonHang> getChitietdonhang() {
		return chitietdonhang;
	}

	public void setChitietdonhang(List<ChiTietDonHang> chitietdonhang) {
		this.chitietdonhang = chitietdonhang;
	}

	public String getMaDonHang() {
		return maDonHang;
	}
	public void setMaDonHang(String maDonHang) {
		this.maDonHang = maDonHang;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public LocalDateTime getNgayLap() {
		return ngayLap;
	}
	public void setNgayLap(LocalDateTime ngayLap) {
		this.ngayLap = ngayLap;
	}

	@Override
	public String toString() {
		return "DonHang [maDonHang=" + maDonHang + ", diaChi=" + diaChi + ", ngayLap=" + ngayLap + ", tongTien="
				 + ", chitietdonhang=" + chitietdonhang + "]";
	}
}
