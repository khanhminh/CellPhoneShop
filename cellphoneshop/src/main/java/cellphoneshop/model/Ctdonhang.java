package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

/**
 * Ctdonhang generated by hbm2java
 */
public class Ctdonhang implements java.io.Serializable {

	private Long maCtdonHang;
	private Sanpham sanpham;
	private Donhang donhang;
	private int giaTungSp;
	private int giamGiaTungSp;
	private int soLuong;
	private int tongGiaTri;

	public Ctdonhang() {
	}

	public Ctdonhang(Sanpham sanpham, Donhang donhang, int giaTungSp,
			int giamGiaTungSp, int soLuong, int tongGiaTri) {
		this.sanpham = sanpham;
		this.donhang = donhang;
		this.giaTungSp = giaTungSp;
		this.giamGiaTungSp = giamGiaTungSp;
		this.soLuong = soLuong;
		this.tongGiaTri = tongGiaTri;
	}

	public Long getMaCtdonHang() {
		return this.maCtdonHang;
	}

	public void setMaCtdonHang(Long maCtdonHang) {
		this.maCtdonHang = maCtdonHang;
	}

	public Sanpham getSanpham() {
		return this.sanpham;
	}

	public void setSanpham(Sanpham sanpham) {
		this.sanpham = sanpham;
	}

	public Donhang getDonhang() {
		return this.donhang;
	}

	public void setDonhang(Donhang donhang) {
		this.donhang = donhang;
	}

	public int getGiaTungSp() {
		return this.giaTungSp;
	}

	public void setGiaTungSp(int giaTungSp) {
		this.giaTungSp = giaTungSp;
	}

	public int getGiamGiaTungSp() {
		return this.giamGiaTungSp;
	}

	public void setGiamGiaTungSp(int giamGiaTungSp) {
		this.giamGiaTungSp = giamGiaTungSp;
	}

	public int getSoLuong() {
		return this.soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getTongGiaTri() {
		return this.tongGiaTri;
	}

	public void setTongGiaTri(int tongGiaTri) {
		this.tongGiaTri = tongGiaTri;
	}

}