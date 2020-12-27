package com.springmvc.nhom09.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


@Entity
@NamedQueries({@NamedQuery(name = "getAllKhachHang", query = "select KH from NguoiDung KH")})
public class NguoiDung implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String maNguoiDung;
	private String tenNguoiDung;
	private String email;
	private String soDienThoai;
	private String gioiTinh;
	private String tenTaiKhoan;
	private String matKhau;
	private String loaiNguoiDung;
	
	@OneToMany(mappedBy = "nguoidung",fetch = FetchType.EAGER)
	private List<DonHang> donHang;

	

	

	public NguoiDung(String maNguoiDung, String tenNguoiDung, String email, String soDienThoai, String gioiTinh,
			String tenTaiKhoan, String matKhau, String loaiNguoiDung) {
		super();
		this.maNguoiDung = maNguoiDung;
		this.tenNguoiDung = tenNguoiDung;
		this.email = email;
		this.soDienThoai = soDienThoai;
		this.gioiTinh = gioiTinh;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.loaiNguoiDung = loaiNguoiDung;
		
	}

	public String getMaNguoiDung() {
		return maNguoiDung;
	}

	public void setMaNguoiDung(String maNguoiDung) {
		this.maNguoiDung = maNguoiDung;
	}

	public String getTenNguoiDung() {
		return tenNguoiDung;
	}

	public void setTenNguoiDung(String tenNguoiDung) {
		this.tenNguoiDung = tenNguoiDung;
	}

	public String getLoaiNguoiDung() {
		return loaiNguoiDung;
	}

	public void setLoaiNguoiDung(String loaiNguoiDung) {
		this.loaiNguoiDung = loaiNguoiDung;
	}

	public NguoiDung() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public List<DonHang> getDonHang() {
		return donHang;
	}

	public void setDonHang(List<DonHang> donHang) {
		this.donHang = donHang;
	}

	@Override
	public String toString() {
		return "NguoiDung [maNguoiDung=" + maNguoiDung + ", tenNguoiDung=" + tenNguoiDung + ", email=" + email
				+ ", soDienThoai=" + soDienThoai + ", gioiTinh=" + gioiTinh + ", tenTaiKhoan=" + tenTaiKhoan
				+ ", matKhau=" + matKhau + ", loaiNguoiDung=" + loaiNguoiDung;
	}

	
}
