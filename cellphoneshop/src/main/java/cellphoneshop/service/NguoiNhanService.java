package cellphoneshop.service;

import cellphoneshop.model.NguoiNhan;

public interface NguoiNhanService {
	public boolean themNguoiNhan(NguoiNhan nguoiNhan);
	public NguoiNhan getNguoiNhan(Integer maNguoiDung, String tenNguoiNhan);
}
