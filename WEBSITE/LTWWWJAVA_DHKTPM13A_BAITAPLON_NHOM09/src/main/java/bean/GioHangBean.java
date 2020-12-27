package bean;

import java.util.ArrayList;

import com.springmvc.nhom09.model.DoChoi;


public class GioHangBean {
	private ArrayList<Item> listDoChoi = new ArrayList<Item>();

	public double getTongTien() {
		double tongTien = 0;
		for (Item item : listDoChoi) {
			tongTien += item.getDoChoi().getGiatien() * item.getQuantity();
		}
		return tongTien;
	}

	public double getTongTienDonVi(int soLuong, double giaTien) {
		return soLuong * giaTien;
	}

	public int getLineItemCout() {
		return listDoChoi.size();
	}

	public ArrayList<Item> getListDoChoi() {
		return listDoChoi;
	}

	public void setListDoChoi(ArrayList<Item> listDoChoi) {
		this.listDoChoi = listDoChoi;
	}

	public void deleteCartItem(String itemIndex) {
		int index = 0;
		try {
			index = Integer.parseInt(itemIndex);
			listDoChoi.remove(index - 1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void updateCartItem(String stritemIndex, String strquantity) {
		int itemIndex = 0;
		int quantity = 0;
		Item item = null;
		try {
			itemIndex = Integer.parseInt(stritemIndex);
			quantity = Integer.parseInt(strquantity);
			if (quantity > 0) {
				item = (Item) listDoChoi.get(itemIndex - 1);
				item.setQuantity(quantity);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void addCartItem(String maSanPham, int quantity) {
		Item item = new Item();

		try {
			if (quantity > 0) {
				item.setDoChoi(new DoChoi());
				item.setQuantity(quantity);
				listDoChoi.add(item); 

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void addCartItem(Item item) {
		listDoChoi.add(item);
	}

	public GioHangBean(ArrayList<Item> listDoChoi) {
		super();
		this.listDoChoi = listDoChoi;
	}

	public GioHangBean() {
		super();
		// TODO Auto-generated constructor stub
	}

}
