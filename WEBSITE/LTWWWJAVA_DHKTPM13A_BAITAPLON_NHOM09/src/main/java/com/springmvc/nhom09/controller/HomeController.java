package com.springmvc.nhom09.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.nhom09.model.ChiTietDonHang;
import com.springmvc.nhom09.model.DanhMuc;
import com.springmvc.nhom09.model.DoChoi;
import com.springmvc.nhom09.model.DonHang;
import com.springmvc.nhom09.model.NguoiDung;
import com.springmvc.nhom09.service.ChiTietDonHangService;
import com.springmvc.nhom09.service.DanhMucService;
import com.springmvc.nhom09.service.DoChoiService;
import com.springmvc.nhom09.service.DonHangService;
import com.springmvc.nhom09.service.NguoiDungService;

@Controller
public class HomeController {
	private String danhmuc;
	@Autowired(required = true)
	@Qualifier(value = "dochoiService")
	private DoChoiService dochoiService;

	public void setDochoiService(DoChoiService dochoiService) {
		this.dochoiService = dochoiService;
	}

	@Autowired(required = true)
	@Qualifier(value = "danhmucService")
	private DanhMucService danhmucService;

	public void setDanhmucService(DanhMucService danhmucService) {
		this.danhmucService = danhmucService;
	}

	@Autowired(required = true)
	@Qualifier(value = "nguoidungService")
	private NguoiDungService nguoidungService;

	public void setNguoidungService(NguoiDungService nguoidungService) {
		this.nguoidungService = nguoidungService;
	}

	@Autowired(required = true)
	@Qualifier(value = "chitietdonhangService")
	private ChiTietDonHangService chitietdonhangService;

	public void setChitietdonhangService(ChiTietDonHangService chitietdonhangService) {
		this.chitietdonhangService = chitietdonhangService;
	}

	@Autowired(required = true)
	@Qualifier(value = "donhangService")
	private DonHangService donhangService;

	public void setDonhangService(DonHangService donhangService) {
		this.donhangService = donhangService;
	}

	@RequestMapping(value = "/DangNhap")
	public String DangNhapVao(HttpServletRequest request, HttpServletResponse response) {
		return "DangNhap";
	}

	@RequestMapping(value = "/CheckDangNhap")
	public void CheckDangNhap(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String tentaikhoan = request.getParameter("username");
//		String matKhau = request.getParameter("matKhau");
		String matKhau = request.getParameter("password");

		HttpSession session = request.getSession();

		List<NguoiDung> listKh = nguoidungService.listNguoiDung();
		for (NguoiDung khachHang : listKh) {
			if (khachHang.getTenTaiKhoan().equals(tentaikhoan) && khachHang.getMatKhau().equals(matKhau)) {
				session.setAttribute("nguoidung", khachHang);
				response.getWriter().append("1");
				return;
			}
		}
		response.getWriter().append("0");
	}

	@RequestMapping(value = "/DangNhapXuLy", method = RequestMethod.POST)
	public String DangNhap(HttpServletRequest request, HttpServletResponse response) {

		String tentaikhoan = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		HttpSession session = request.getSession();

		List<NguoiDung> listKh = nguoidungService.listNguoiDung();
		for (NguoiDung khachHang : listKh) {
			if (khachHang.getTenTaiKhoan().equals(tentaikhoan) && khachHang.getMatKhau().equals(matKhau)) {
				session.setAttribute("nguoidung", khachHang);
				// getServletContext().getRequestDispatcher("/ShowProductList").forward(request,
				// response);

				// response.sendRedirect(getServletContext().getContextPath()+"/ShowProductList");
				return "redirect:";
			}
		}
		// response.sendRedirect("view/DangNhap.jsp");
		// getServletContext().getRequestDispatcher("/view/DangNhap.jsp").forward(request,
		// response);

		return "DangNhap";
	}

	@RequestMapping(value = "/DangXuat")
	public String DangXuat(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		session.removeAttribute("nguoidung");
		// getServletContext().getRequestDispatcher("/ShowProductList").forward(request,
		// response);

		return "redirect:HOME";
	}

	@RequestMapping(value = { "HOMEDANHMUC" }, method = RequestMethod.GET)
	public String homecheck(@RequestParam("danhmuc") String danhmuc, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		this.danhmuc = danhmuc;
		return "redirect:HOME";
	}

	@RequestMapping(value = { "DangKy" }, method = RequestMethod.GET)
	public String DangKy(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "DangKy";
	}

	@RequestMapping(value = { "DangKyController" }, method = RequestMethod.POST)
	public String DangKyControler(Model model, HttpServletRequest request, HttpServletResponse response) {
		String tenkhachhang = request.getParameter("tenKhachHang");
		String email = request.getParameter("email");
		String soDienthoai = request.getParameter("soDienThoai");
		String gt = request.getParameter("gioiTinh");
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		List<NguoiDung> listKhachHang = nguoidungService.listNguoiDung();
		String maKhachHang = "";
		if (listKhachHang.size() == 0) {
			maKhachHang = "khachhang1";
		} else {
			String maCu = "";
			for (NguoiDung khachHang : listKhachHang) {
				maCu = khachHang.getMaNguoiDung();
			}
			String chuoi = maCu.replaceAll("khachhang", "");
			int intMaMoi = Integer.parseInt(chuoi);
			intMaMoi++;
			maKhachHang = "khachhang" + String.valueOf(intMaMoi);
		}
		NguoiDung kh = new NguoiDung(maKhachHang, tenkhachhang, email, soDienthoai, gt, tenDangNhap, matKhau,
				"khachhang");
//		System.out.println(kh);
		nguoidungService.addNguoiDung(kh);
		return "redirect:DangNhap";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = { "/", "HOME" }, method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, HttpServletResponse response) {

		DonHang dh = new DonHang();
		dh = new DonHang("DonHang3", "Go Vap", LocalDateTime.now(), nguoidungService.getNguoiDungById("khachhang1"));
		List<ChiTietDonHang> li = new ArrayList<ChiTietDonHang>();

		// dh.setChitietdonhang(li);
		// System.out.println(donhangService.getDonHangById("DonHang2").toString());
		// System.out.println("=======");

		// donhangService.addDonHang(dh);
		ChiTietDonHang ct = new ChiTietDonHang();
//		System.out.println(dochoiService.getDoChoiById("dochoi1"));
//		System.out.println(donhangService.getDonHangById("DonHang3"));
		ct.setDoChoi(dochoiService.getDoChoiById("dochoi1"));
		ct.setDonHang(donhangService.getDonHangById("DonHang3"));
		ct.setDonGia(12000);
		ct.setSoLuong(23);
//		System.out.println(ct.toString());
		li.add(ct);
//		chitietdonhangService.addChiTietDonHang(ct);

		// String danhmuc = request.getParameter("danhmuc");

		System.out.println(danhmuc);
		List<DoChoi> listDoChoi = new ArrayList<DoChoi>();
		// listDoChoi = dochoiService.listDoChoiDanhMuc("danhmuc1");
		if (danhmuc == null) {
			listDoChoi = dochoiService.listDoChoi();

		} else {
			// listDoChoi = dochoiService.listDoChoiDanhMuc(danhmuc);
			listDoChoi = dochoiService.listDoChoi();
			Iterator<DoChoi> itr = listDoChoi.iterator();
			while (itr.hasNext()) {
				DoChoi x = (DoChoi) itr.next();
				System.out.println(x.getTinhTrang());
				if (!x.getDanhmuc().getMaDanhMuc().equals(danhmuc)) {
					itr.remove();
				}
			}

			danhmuc = null;
		}

		Iterator<DoChoi> itr = listDoChoi.iterator();
		while (itr.hasNext()) {
			DoChoi x = (DoChoi) itr.next();
			System.out.println(x.getTinhTrang());
			if (x.getTinhTrang().equals("NGỪNG KINH DOANH")) {
				itr.remove();
			}

		}
		request.setAttribute("dsDoChoi", listDoChoi);

		List<DanhMuc> listDanhMuc = danhmucService.listDanhMuc();
		// request.setAttribute("dsDanhMuc", listDanhMuc);
		HttpSession sesion = request.getSession();
		sesion.setAttribute("dsDanhMuc", listDanhMuc);
		return "home";
	}

	@RequestMapping(value = { "/ThongTinChiTietController" }, method = RequestMethod.GET)
	public String ThongTinChiTiet(@RequestParam("id") String nameid, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		List<DoChoi> list = this.dochoiService.listDoChoi();
		model.addAttribute("dsDoChoi", list);

		DoChoi dochoi = dochoiService.getDoChoiById(nameid);
		request.setAttribute("dochoi", dochoi);

		List<DanhMuc> listDanhMuc = danhmucService.listDanhMuc();
		model.addAttribute("Chitietdanhmuc", listDanhMuc);

		return "ChiTietSanPham";
	}

}
