package cellphoneshop.dao;

import cellphoneshop.model.NguoiNhan;

public interface NguoiNhanDAO {
	public void themNguoiNhan(NguoiNhan nguoiNhan);
	public NguoiNhan getNguoiNhan(Integer maNguoiDung, String tenNguoiNhan);
	public boolean capNhatNguoiNhan(NguoiNhan nguoiNhan);
	public boolean xoaNguoiNhan(NguoiNhan nguoiNhan);
}
