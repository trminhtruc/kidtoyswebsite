package com.springmvc.nhom09.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
import com.sun.org.apache.bcel.internal.generic.DMUL;

@Controller
public class QuanLyController {
	private String xoasanphpam;

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

	@RequestMapping(value = "/QuanLySanPham")
	public String QuanLySanPham(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		if (xoasanphpam != null) {

			DoChoi dc = dochoiService.getDoChoiById(xoasanphpam);
			List<DonHang> list = donhangService.listDonHang();
			int tamp = 0;
			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.get(i).getChitietdonhang().size(); j++) {
					if (list.get(i).getChitietdonhang().get(j).getDoChoi().getMaDoChoi().equals(dc.getMaDoChoi())) {
						tamp = 1;
						session.setAttribute("xoasanpham", "114");
						this.xoasanphpam = null;
					}
				}
			}
			if (tamp == 0) {
				dochoiService.removeDoChoi(dc);
				session.setAttribute("xoasanpham", "113");
				this.xoasanphpam = null;
			}
		}

		List<DoChoi> listDoChoi = dochoiService.listDoChoi();
		request.setAttribute("dsDoChoi", listDoChoi);

		return "Quanlysanpham";
	}

	@RequestMapping(value = "/XoaSanPham")
	public String XoaSanPham(@RequestParam(name = "xoa") String xoa, HttpServletRequest request,
			HttpServletResponse response) {
		this.xoasanphpam = xoa;
		return "redirect:QuanLySanPham";
//		getServletContext().getRequestDispatcher("/view/Quanlysanpham.jsp").forward(request, response);
	}

	@RequestMapping(value = "/ChinhSua")
	public String ChinhSua(@RequestParam(name = "id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		String madochoi = request.getParameter("id");
		DoChoi dochoi = dochoiService.getDoChoiById(madochoi);
		request.setAttribute("dochoi", dochoi);
//		getServletContext().getRequestDispatcher("/view/Chinhsuasanpham.jsp").forward(request, response);
		return "Chinhsuasanpham";
		// getServletContext().getRequestDispatcher("/view/Quanlysanpham.jsp").forward(request,
		// response);
	}

	@RequestMapping(value = "/CapNhatSanPham", method = RequestMethod.POST)
	public String CapNhatSanPham(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String maDoChoi = request.getParameter("masanpham");
		String tenDoChoi = request.getParameter("tensanpham");
		String moTa = request.getParameter("mota");
		// String hinhAnhURL = request.getParameter("hinh");
		String giaTien = request.getParameter("giatien");
		String soLuong = request.getParameter("soluong");
		String tinhtrang = request.getParameter("tinhtrang");
		String dmuc = request.getParameter("danhmuc");
		DanhMuc danhmuc = danhmucService.getDanhMucById(dmuc);
		DoChoi updatedochoi = dochoiService.getDoChoiById(maDoChoi);
		updatedochoi.setTenDoChoi(tenDoChoi);
		updatedochoi.setMoTa(moTa);
		updatedochoi.setGiatien(Double.parseDouble(giaTien));
		updatedochoi.setSoLuong(Integer.parseInt(soLuong));
		updatedochoi.setTinhTrang(tinhtrang);
		updatedochoi.setDanhmuc(danhmuc);

		File file;
		String fileName;
		if (request.getParameter("hinh").equals("")) {
			request.getParameter("hinhmacdinh");
		} else {
			file = new File(request.getParameter("hinh"));
			fileName = file.getName().toString();
			updatedochoi.setHinhAnhURL("img/" + fileName);
		}

		dochoiService.updateDoChoi(updatedochoi);

		return "redirect:QuanLySanPham";
//		response.sendRedirect(getServletContext().getContextPath() + "/QuanLySanPham");

		// getServletContext().getRequestDispatcher("/view/Quanlysanpham.jsp").forward(request,
		// response);
	}

	@RequestMapping(value = "/TimKiemController")
	public String TimKiemControler(HttpServletRequest request, HttpServletResponse response) {
		List<DoChoi> listDoChoi = dochoiService.listDoChoi();
		System.out.println(listDoChoi.size());
		String ten = request.getParameter("search");

		/* CHỨC NĂNG TÌM KIẾM SẢN PHẨM */
		/*
		 * ==============================================================='''===========
		 * ========================
		 */ if (ten != null) {
			ArrayList<DoChoi> listNew = new ArrayList<DoChoi>();

			for (DoChoi dchoi : listDoChoi) {
				System.out.println(dchoi.getTenDoChoi());
				if (dchoi.getTenDoChoi().toUpperCase().contains(ten.toUpperCase())) {
					listNew.add(dchoi);
				}
			}
			request.setAttribute("dsDoChoi", listNew);
			return "Quanlysanpham";
		} else {
			request.setAttribute("dsDoChoi", listDoChoi);
			return "Quanlysanpham";
		}
		// getServletContext().getRequestDispatcher("/view/Quanlysanpham.jsp").forward(request,
		// response);
	}

	@RequestMapping(value = "/DanhSachDonHang")
	public String DanhSachDonHang(HttpServletRequest request, HttpServletResponse response) {
		List<DonHang> listDonHang = donhangService.listDonHang();
		request.setAttribute("dsDonHang", listDonHang);
		for (DonHang donHang : listDonHang) {
			System.out.println(donHang.getMaDonHang());
		}
		return "DanhSachDonHang";
	}

	@RequestMapping(value = "/DangKy2")
	public String DangKy2(HttpServletRequest request, HttpServletResponse response) {

		return "register";
	}

	@RequestMapping(value = "/ChiTietDonHangController")
	public String ChiTietDonHangController(HttpServletRequest request, HttpServletResponse response) {
		DonHang listDonHang = donhangService.getDonHangById(request.getParameter("machitiet"));

		request.setAttribute("dsDonHang", listDonHang.getChitietdonhang());
		for (ChiTietDonHang donHang : listDonHang.getChitietdonhang()) {
//			System.out.println(donHang.getMaDonHang());
			// System.out.println(donHang.get);
			System.out.println(donHang.getDonGia());
			System.out.println(donHang.getSoLuong());
			System.out.println(donHang.getDoChoi().getTenDoChoi());
			System.out.println(donHang.getDonHang().getMaDonHang());

		}

		// getServletContext().getRequestDispatcher("/view/ChiTietDonHang.jsp").forward(request,
		// response);
		return "ChiTietDonHang";
	}

	@RequestMapping(value = "/CapNhatDonHang")
	public String CapNhatDonHang(HttpServletRequest request, HttpServletResponse response) {

		String machitiet = request.getParameter("idchitiet");
		String soluong = request.getParameter("soLuong");
		String machitietdc = request.getParameter("idchitietdc");

		System.out.println(machitiet);
		System.out.println(soluong);
		System.out.println(machitietdc);

		DonHang list = donhangService.getDonHangById(machitiet);
		// System.out.println();
		// System.out.println(dc.timTheoId("dochoi1"));
		for (ChiTietDonHang donhang : list.getChitietdonhang()) {
			if (donhang.getDoChoi().getMaDoChoi().equals(machitietdc)) {
				donhang.setSoLuong(Integer.parseInt(soluong));
			}
		}
		System.out.println(list.getChitietdonhang().get(0).getSoLuong());
		donhangService.updateDonHang(list);

		// getServletContext().getRequestDispatcher("/view/ChiTietDonHang.jsp").forward(request,
		// response);
		return "redirect:DanhSachDonHang";
	}

	@RequestMapping(value = "/ThemSanPham", method = RequestMethod.POST)
	public String ThemSanPham(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		File file = new File(request.getParameter("hinh"));
		String fileName = file.getName().toString();

		// eint cn = Integer.parseInt(request.getParameter("cn"));
		List<DoChoi> listDoChoi = dochoiService.listDoChoi();

		String maDoChoi = "";
		if (listDoChoi.size() == 0) {
			maDoChoi = "dochoi1";
		} else {
			String maCu = "";
			for (DoChoi donhang : listDoChoi) {
				maCu = donhang.getMaDoChoi();
			}
			String moi = maCu.replaceAll("dochoi", "");
			int intMaMoi = Integer.parseInt(moi);
			intMaMoi++;
			maDoChoi = "dochoi" + String.valueOf(intMaMoi);
		}

		DoChoi sanPham = new DoChoi(maDoChoi, request.getParameter("tendochoi"), "ĐANG KINH DOANH",
				request.getParameter("mota"), "img/" + fileName, Double.parseDouble(request.getParameter("dongia")),
				Integer.parseInt(request.getParameter("soluong")));

		// sanPham.setGia(Integer.parseInt(request.getParameter("gia")));
		// sanPham.setSoLuong(Integer.parseInt(request.getParameter("soluong")));
		// sanPham.setMoTa(request.getParameter("mota"));
		// sanPham.setHinh("images/HinhSanPham/" + fileName);
		// DanhMuc danhMuc = danhMucDAORemote
		// .getDanhMucFindByMaDanhMuc(Integer.parseInt(request.getParameter("madanhmuc")));

		DanhMuc dm = danhmucService.getDanhMucById(request.getParameter("danhmuc"));

		sanPham.setDanhmuc(dm);
		System.out.println(sanPham.toString() + dm.getTenDanhMuc());
//		sanPhamDAORemote.persistSanPham(sanPham);
		dochoiService.addDoChoi(sanPham);
		// response.sendRedirect(getServletContext().getContextPath() +
		// "/QuanLySanPham");
		return "redirect:QuanLySanPham";
	}

	@RequestMapping(value = "/ShowThem")
	public String ShowThem(HttpServletRequest request, HttpServletResponse response) {

		return "Themsanpham";
	}

	@RequestMapping(value = "/Handle")
	public void Handle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String doWhat = request.getParameter("do");
		if (doWhat.equals("register")) {
			String fullName = request.getParameter("fullname");
			int gender = Integer.parseInt(request.getParameter("gender"));
			String phone = request.getParameter("phone");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String rePassword = request.getParameter("repassword");
			JSONObject resultJson = new JSONObject();
			try {
				boolean unameExist = false;
				boolean emailExist = false;
				List<NguoiDung> dsnd = nguoidungService.listNguoiDung();
				for (NguoiDung nd : dsnd) {
					if (!unameExist && nd.getTenTaiKhoan().equalsIgnoreCase(username)) {
						unameExist = true;
						if (emailExist)
							break;
					}
					if (!emailExist && nd.getEmail().equalsIgnoreCase(email)) {
						emailExist = true;
						if (unameExist)
							break;
					}
				}
				System.out.println(username);
				if (unameExist) {
					resultJson.put("state", 1);
					resultJson.put("message", "Tên tài khoản này đã tồn tại");
				} else if (emailExist) {
					resultJson.put("state", 2);
					resultJson.put("message", "Email đã tồn tại");
				} else {
					NguoiDung nd = new NguoiDung("KH" + dsnd.size(), fullName, email, phone,
							(gender == 0 ? "Nam" : "Nữ"), username, password, "1");
					nguoidungService.addNguoiDung(nd);
					resultJson.put("state", 0);
					resultJson.put("message",
							"Bạn đã đăng ký thành công! Bạn sẽ được chuyển đến trang đích sau 3 giây nữa hoặc bấm <a href=\"/register.html\" class=\"alert-link\">vào đây</a>.");
					resultJson.put("redirect", "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/view/DangNhap.jsp");
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.getWriter().append(resultJson.toString());
			System.out.println(resultJson);
		} else if (doWhat.equals("get-all-category")) {
			List<DanhMuc> list = danhmucService.listDanhMuc();

			JSONObject resultJson = new JSONObject();

			JSONArray categories = new JSONArray();
			for (DanhMuc category : list) {
				JSONObject categoryJson = new JSONObject();
				try {
					categoryJson.put("id", category.getMaDanhMuc());
					categoryJson.put("name", category.getTenDanhMuc());
					List<DoChoi> dsdc = category.getDochoi();
					int productCount = 0;
					if (dsdc != null) {
						productCount = dsdc.size();
					}
					categoryJson.put("productCount", productCount);
					// select count(*) from dochoi where madanhmuc = id
				} catch (JSONException e) {
					e.printStackTrace();
				}
				categories.put(categoryJson);
			}

			try {
				resultJson.put("categories", categories);
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.getWriter().append(resultJson.toString());
//			System.out.println(resultJson);
		} else if (doWhat.equals("delete-category")) {
			JSONObject resultJson = new JSONObject();
			String id = request.getParameter("id");
//			boolean deleted = delete from danhmuc where madanhmuc=id

			try {
				boolean deleted = true;
				danhmucService.removeDanhMuc(id);
				if (deleted) {
					resultJson.put("state", 0);
				} else {
					resultJson.put("state", 1);
					resultJson.put("message", "Đã có lỗi xảy ra không thể xóa!");
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.getWriter().append(resultJson.toString());
		} else if (doWhat.equals("delete-empty-category")) {
			JSONObject resultJson = new JSONObject();
			try {
				boolean deleted = true;
				for (DanhMuc dm : danhmucService.listDanhMuc()) {
					List<DoChoi> dsdc = dm.getDochoi();
					if (dsdc == null || dsdc.size() == 0) {
						danhmucService.removeDanhMuc(dm.getMaDanhMuc());
					}
				}
//				boolean deleted = delete from danhmuc where madanhmuc=id
				if (deleted) {
					resultJson.put("state", 0);
				} else {
					resultJson.put("state", 1);
					resultJson.put("message", "Đã có lỗi xảy ra không thể xóa!");
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.getWriter().append(resultJson.toString());
		} else if (doWhat.equals("update-category")) {
			String newName = request.getParameter("newName");
			String id = request.getParameter("id");
			JSONObject resultJson = new JSONObject();
			try {
				if (newName == null || id == null) {
					resultJson.put("state", 1);
					resultJson.put("message", "Đã có lỗi xảy ra (1)");
				} else {
					boolean updated = true;
					DanhMuc newDm = new DanhMuc(id, newName);
					danhmucService.updateDanhMuc(newDm);
					if (updated) {
						resultJson.put("state", 0);
					} else {
						resultJson.put("state", 2);
						resultJson.put("message", "Đã xảy ra lỗi (2)");
					}
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.getWriter().append(resultJson.toString());
		} else if (doWhat.equals("add-category")) {
			String name = request.getParameter("name");
			JSONObject resultJson = new JSONObject();
			try {
				if (name == null) {
					resultJson.put("state", 1);
					resultJson.put("message", "Đã có lỗi xảy ra (1)");
				} else {
					System.out.println(name);
					List<DanhMuc> ds = danhmucService.listDanhMuc();
					boolean inserted = true;
					danhmucService.addDanhMuc(new DanhMuc("danhmuc" + (ds.size() + 1), name));
//				boolean inserted = insert into danhmuc values(name=name)
//					if(inserted) {
					resultJson.put("state", 0);
//					}else {
//						resultJson.put("state", 2);
//						resultJson.put("message", "Đã xảy ra lỗi (2)");
//					}
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
			response.getWriter().append(resultJson.toString());
		}

	}
}
