package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

/**
 * Thongsopin generated by hbm2java
 */
public class Thongsopin implements java.io.Serializable {

	private Long maThongSoPin;
	private Ctsanpham ctsanpham;
	private Float dungLuongPin;
	private Float dienAp;
	private String congNghe;

	public Thongsopin() {
	}

	public Thongsopin(Ctsanpham ctsanpham) {
		this.ctsanpham = ctsanpham;
	}

	public Thongsopin(Ctsanpham ctsanpham, Float dungLuongPin, Float dienAp,
			String congNghe) {
		this.ctsanpham = ctsanpham;
		this.dungLuongPin = dungLuongPin;
		this.dienAp = dienAp;
		this.congNghe = congNghe;
	}

	public Long getMaThongSoPin() {
		return this.maThongSoPin;
	}

	public void setMaThongSoPin(Long maThongSoPin) {
		this.maThongSoPin = maThongSoPin;
	}

	public Ctsanpham getCtsanpham() {
		return this.ctsanpham;
	}

	public void setCtsanpham(Ctsanpham ctsanpham) {
		this.ctsanpham = ctsanpham;
	}

	public Float getDungLuongPin() {
		return this.dungLuongPin;
	}

	public void setDungLuongPin(Float dungLuongPin) {
		this.dungLuongPin = dungLuongPin;
	}

	public Float getDienAp() {
		return this.dienAp;
	}

	public void setDienAp(Float dienAp) {
		this.dienAp = dienAp;
	}

	public String getCongNghe() {
		return this.congNghe;
	}

	public void setCongNghe(String congNghe) {
		this.congNghe = congNghe;
	}

}
