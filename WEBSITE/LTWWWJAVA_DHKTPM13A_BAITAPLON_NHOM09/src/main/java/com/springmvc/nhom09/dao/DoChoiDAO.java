package com.springmvc.nhom09.dao;

import java.util.List;
import com.springmvc.nhom09.model.DoChoi;

public interface DoChoiDAO {
	public void addDoChoi(DoChoi dc);

	public List<DoChoi> listDoChoi();

	public DoChoi getDoChoiById(String id);

	public void removeDoChoi(DoChoi id);

	public void updateDoChoi(DoChoi dc);
}
