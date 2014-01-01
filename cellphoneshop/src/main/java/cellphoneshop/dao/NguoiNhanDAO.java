package cellphoneshop.dao;

import cellphoneshop.model.NguoiNhan;

public interface NguoiNhanDAO {
	boolean themNguoiNhan(NguoiNhan nguoiNhan);
	NguoiNhan getNguoiNhan(Integer maNguoiDung, String tenNguoiNhan);
	boolean capNhatNguoiNhan(NguoiNhan nguoiNhan);
	boolean xoaNguoiNhan(NguoiNhan nguoiNhan);
}
