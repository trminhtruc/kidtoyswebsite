package com.springmvc.nhom09.service;

import java.util.List;

import com.springmvc.nhom09.model.DoChoi;

public interface DoChoiService {

	public void addDoChoi(DoChoi dc);

	public List<DoChoi> listDoChoi();

	public DoChoi getDoChoiById(String id);

	public void removeDoChoi(DoChoi dc);

	public void updateDoChoi(DoChoi dc);
}
