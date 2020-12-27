package com.springmvc.nhom09.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springmvc.nhom09.GmailQuickstart;
import com.springmvc.nhom09.model.ChiTietDonHang;
import com.springmvc.nhom09.model.DoChoi;
import com.springmvc.nhom09.model.DonHang;
import com.springmvc.nhom09.model.NguoiDung;
import com.springmvc.nhom09.service.ChiTietDonHangService;
import com.springmvc.nhom09.service.DanhMucService;
import com.springmvc.nhom09.service.DoChoiService;
import com.springmvc.nhom09.service.DonHangService;
import com.springmvc.nhom09.service.NguoiDungService;

import bean.GioHangBean;
import bean.Item;

@Controller
public class GioHangController {
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
	@Qualifier(value = "donhangService")
	private DonHangService donhangService;

	public void setDonhangService(DonHangService donhangService) {
		this.donhangService = donhangService;
	}

	@Autowired(required = true)
	@Qualifier(value = "chitietdonhangService")
	private ChiTietDonHangService chitietdonhangService;

	public void setChitietdonhangService(ChiTietDonHangService chitietdonhangService) {
		this.chitietdonhangService = chitietdonhangService;
	}

	private GioHangBean gioHang;

	@RequestMapping(value = "/GioHang")
	public String ShowGioHang(HttpServletRequest request, HttpServletResponse response) {
		return "ShoppingCart";
	}

	@RequestMapping(value = "/CheckOut")
	public String ThanhToan(HttpServletRequest request, HttpServletResponse response) {
		return "Checkout";
	}

	@RequestMapping(value = "/KiemTraThanhToan")
	public String KiemTraThanhToan(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("nguoidung") == null) {
			return "redirect:DangNhap";
		} else {
			return "redirect:CheckOut";
		}
	}

	@RequestMapping(value = { "/CartController" }, method = RequestMethod.POST)
	public String GioHang(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String strAction = request.getParameter("action");
		System.out.println(strAction + "========");
		if (strAction != null && !strAction.equals("")) {
			if (strAction.equals("add")) {
				addToCart(request);
				return "redirect:GioHang";
			} else if (strAction.equals("update")) {
				updateCart(request);
				return "redirect:GioHang";
			} else if (strAction.equals("delete")) {
				deleteCartItem(request);
				return "redirect:GioHang";
			} else if (strAction.equals("checkout")) {
				return "redirect:CheckOut";
			} else if (strAction.equals("Save")) {
				datHang(request);
				deleteCart(request);
				return "redirect:GioHang";
			}
		}
		return "redirect:GioHang";
	}

	private void datHang(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String shippingAddress = request.getParameter("diaChiGiaoHang");
		if (gioHang != null) {
			String maDonHang = "";
			List<DonHang> listDonHang = donhangService.listDonHang();
			System.out.println(listDonHang.size());
			if (listDonHang.size() == 0) {
				maDonHang = "DonHang1";
			} else {
				String maCu = "";
				int max = 0;
				int intMaMoi;
				for (DonHang donhang : listDonHang) {
					maCu = donhang.getMaDonHang();
					String moi = maCu.replaceAll("DonHang", "");
					intMaMoi = Integer.parseInt(moi);
					if (intMaMoi > max) {
						max = intMaMoi;
					}
				}
				++max;
				maDonHang = "DonHang" + String.valueOf(max);
				System.out.println(maDonHang);
			}
			HttpSession session = request.getSession();
			NguoiDung khachHang = (NguoiDung) session.getAttribute("nguoidung");
			DonHang donHang = new DonHang(maDonHang, shippingAddress, LocalDateTime.now(), khachHang);
			List<ChiTietDonHang> listChiTiet = new ArrayList<ChiTietDonHang>();
			for (Item item : gioHang.getListDoChoi()) {
				listChiTiet.add(new ChiTietDonHang(donHang, item.getDoChoi(), item.getDoChoi().getGiatien(),
						item.getQuantity()));
			}
			for (ChiTietDonHang chiTietDonHang : listChiTiet) {
				for (DoChoi dochoi : dochoiService.listDoChoi()) {
					if (chiTietDonHang.getDoChoi().getMaDoChoi().equals(dochoi.getMaDoChoi())) {

						DoChoi dc = dochoiService.getDoChoiById(chiTietDonHang.getDoChoi().getMaDoChoi());

						dc.setSoLuong(dochoi.getSoLuong() - chiTietDonHang.getSoLuong());

						// dochoiService.updateDoChoi(dc);

					}
				}
			}
			// donHang.setChitietdonhang(listChiTiet);

			donhangService.addDonHang(donHang);
			for (ChiTietDonHang chiTietDonHang : listChiTiet) {
				chitietdonhangService.addChiTietDonHang(chiTietDonHang);
			}
			try {
				GmailQuickstart asdf = new GmailQuickstart();
				asdf.send(khachHang.getEmail(), "Dat Hang Thanh Cong", "Ban da dat hang thanh cong tai cua hang Toy child");
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}

	}

	private void deleteCart(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.removeAttribute("cart");

	}

	private void deleteCartItem(HttpServletRequest request) {
		// TODO Auto-generated method stub

		String ma = request.getParameter("maDoChoiUpdate");
		HttpSession session = request.getSession();
		Object objcartBean = session.getAttribute("cart");
		gioHang = (GioHangBean) objcartBean;

		List<Item> dsitem = new ArrayList<Item>();
		for (Item ii : gioHang.getListDoChoi()) {
			if (ii.getDoChoi().getMaDoChoi().equals(ma)) {
				dsitem.add(ii);
			}
		}
		gioHang.getListDoChoi().removeAll(dsitem);
		if (gioHang.getListDoChoi().size() == 0) {
			deleteCart(request);
		}
		return;
	}

	private void updateCart(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String ma = request.getParameter("maDoChoiUpdate");

		String sl = request.getParameter("soLuong");

		HttpSession session = request.getSession();
		Object objcartBean = session.getAttribute("cart");
		gioHang = (GioHangBean) objcartBean;
		Item item = new Item();
		item.setDoChoi(dochoiService.getDoChoiById(ma));
		item.setQuantity(Integer.parseInt(sl));

		if (Integer.parseInt(sl) == 0) {
			System.out.println(item.toString());

			List<Item> dsitem = new ArrayList<Item>();
			for (Item ii : gioHang.getListDoChoi()) {
				if (ii.getDoChoi().getMaDoChoi().equals(ma)) {
					dsitem.add(ii);
				}
			}
			gioHang.getListDoChoi().removeAll(dsitem);

			if (gioHang.getListDoChoi().size() == 0) {
				deleteCart(request);
			}
			System.out.println(gioHang.getListDoChoi().size() + "kich thuoc");
			return;
		}

		for (Item i : gioHang.getListDoChoi()) {
			if (i.getDoChoi().getMaDoChoi().equals(ma)) {
				i.setQuantity(Integer.parseInt(sl));
			}
		}
		return;
	}

	private void addToCart(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String maDoChoi = request.getParameter("maDoChoi");
		String soLuong = request.getParameter("soLuong");
		Object objcartBean = session.getAttribute("cart");

		if (objcartBean != null) {
			gioHang = (GioHangBean) objcartBean;

			for (Item iterable_element : gioHang.getListDoChoi()) {
				System.out.println(iterable_element.getDoChoi().getMaDoChoi());
			}
		} else {

			gioHang = new GioHangBean();
			session.setAttribute("cart", gioHang);
		}

		Item item = new Item();
		item.setDoChoi(dochoiService.getDoChoiById(maDoChoi));
		item.setQuantity(Integer.parseInt(soLuong));
		if (gioHang.getListDoChoi().size() == 0) {
			gioHang.addCartItem(item);
		} else {
			for (Item dochoi : gioHang.getListDoChoi()) {
				if (dochoi.getDoChoi().getMaDoChoi().equals(maDoChoi)) {
					dochoi.setQuantity(dochoi.getQuantity() + Integer.parseInt(soLuong));
					return;
				}
			}
			gioHang.addCartItem(item);
		}

	}

}
