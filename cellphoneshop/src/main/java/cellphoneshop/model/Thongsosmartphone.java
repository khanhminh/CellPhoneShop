package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

/**
 * Thongsosmartphone generated by hbm2java
 */
public class Thongsosmartphone implements java.io.Serializable {

	private Long maThongSoSmartPhone;
	private Ctsanpham ctsanpham;
	private Loaibanphim loaibanphim;
	private Hedieuhanh hedieuhanh;
	private String loaiManhinh;
	private String soMauManHinh;
	private String doPhanGiaiManHinh;
	private String chuanManHinh;
	private Float kichThuocManHinh;
	private String camUng;
	private String matDoDiemAnh;
	private String cameraSau;
	private String cameraTruoc;
	private String tinhNangCamera;
	private String quayPhim;
	private Boolean videoCall;
	private Float tocDoCpu;
	private Short soNhanCpu;
	private String chipset;
	private String ram;
	private String gpu;
	private String boNhoTrong;
	private String theNhoNgoai;
	private Short dungLuongTheToiDa;
	private Float dungLuongPin;
	private String congNghePin;
	private Boolean pinCoTheThaoRoi;
	private Float thoiGianChoToiDa;
	private Float thoiGianChoQuayPhim;
	private Float thoiGianChoGoiDien;
	private String mang2g;
	private String mang3g;
	private String mang4g;
	private String wifi;
	private String bluetooth;
	private String gprs;
	private Short soLuongSim;
	private String gps;
	private String boCamBien;
	private String denFlash;
	private String denPin;

	public Thongsosmartphone() {
	}

	public Thongsosmartphone(Ctsanpham ctsanpham) {
		this.ctsanpham = ctsanpham;
	}

	public Thongsosmartphone(Ctsanpham ctsanpham, Loaibanphim loaibanphim,
			Hedieuhanh hedieuhanh, String loaiManhinh, String soMauManHinh,
			String doPhanGiaiManHinh, String chuanManHinh,
			Float kichThuocManHinh, String camUng, String matDoDiemAnh,
			String cameraSau, String cameraTruoc, String tinhNangCamera,
			String quayPhim, Boolean videoCall, Float tocDoCpu,
			Short soNhanCpu, String chipset, String ram, String gpu,
			String boNhoTrong, String theNhoNgoai, Short dungLuongTheToiDa,
			Float dungLuongPin, String congNghePin, Boolean pinCoTheThaoRoi,
			Float thoiGianChoToiDa, Float thoiGianChoQuayPhim,
			Float thoiGianChoGoiDien, String mang2g, String mang3g,
			String mang4g, String wifi, String bluetooth, String gprs,
			Short soLuongSim, String gps, String boCamBien, String denFlash,
			String denPin) {
		this.ctsanpham = ctsanpham;
		this.loaibanphim = loaibanphim;
		this.hedieuhanh = hedieuhanh;
		this.loaiManhinh = loaiManhinh;
		this.soMauManHinh = soMauManHinh;
		this.doPhanGiaiManHinh = doPhanGiaiManHinh;
		this.chuanManHinh = chuanManHinh;
		this.kichThuocManHinh = kichThuocManHinh;
		this.camUng = camUng;
		this.matDoDiemAnh = matDoDiemAnh;
		this.cameraSau = cameraSau;
		this.cameraTruoc = cameraTruoc;
		this.tinhNangCamera = tinhNangCamera;
		this.quayPhim = quayPhim;
		this.videoCall = videoCall;
		this.tocDoCpu = tocDoCpu;
		this.soNhanCpu = soNhanCpu;
		this.chipset = chipset;
		this.ram = ram;
		this.gpu = gpu;
		this.boNhoTrong = boNhoTrong;
		this.theNhoNgoai = theNhoNgoai;
		this.dungLuongTheToiDa = dungLuongTheToiDa;
		this.dungLuongPin = dungLuongPin;
		this.congNghePin = congNghePin;
		this.pinCoTheThaoRoi = pinCoTheThaoRoi;
		this.thoiGianChoToiDa = thoiGianChoToiDa;
		this.thoiGianChoQuayPhim = thoiGianChoQuayPhim;
		this.thoiGianChoGoiDien = thoiGianChoGoiDien;
		this.mang2g = mang2g;
		this.mang3g = mang3g;
		this.mang4g = mang4g;
		this.wifi = wifi;
		this.bluetooth = bluetooth;
		this.gprs = gprs;
		this.soLuongSim = soLuongSim;
		this.gps = gps;
		this.boCamBien = boCamBien;
		this.denFlash = denFlash;
		this.denPin = denPin;
	}

	public Long getMaThongSoSmartPhone() {
		return this.maThongSoSmartPhone;
	}

	public void setMaThongSoSmartPhone(Long maThongSoSmartPhone) {
		this.maThongSoSmartPhone = maThongSoSmartPhone;
	}

	public Ctsanpham getCtsanpham() {
		return this.ctsanpham;
	}

	public void setCtsanpham(Ctsanpham ctsanpham) {
		this.ctsanpham = ctsanpham;
	}

	public Loaibanphim getLoaibanphim() {
		return this.loaibanphim;
	}

	public void setLoaibanphim(Loaibanphim loaibanphim) {
		this.loaibanphim = loaibanphim;
	}

	public Hedieuhanh getHedieuhanh() {
		return this.hedieuhanh;
	}

	public void setHedieuhanh(Hedieuhanh hedieuhanh) {
		this.hedieuhanh = hedieuhanh;
	}

	public String getLoaiManhinh() {
		return this.loaiManhinh;
	}

	public void setLoaiManhinh(String loaiManhinh) {
		this.loaiManhinh = loaiManhinh;
	}

	public String getSoMauManHinh() {
		return this.soMauManHinh;
	}

	public void setSoMauManHinh(String soMauManHinh) {
		this.soMauManHinh = soMauManHinh;
	}

	public String getDoPhanGiaiManHinh() {
		return this.doPhanGiaiManHinh;
	}

	public void setDoPhanGiaiManHinh(String doPhanGiaiManHinh) {
		this.doPhanGiaiManHinh = doPhanGiaiManHinh;
	}

	public String getChuanManHinh() {
		return this.chuanManHinh;
	}

	public void setChuanManHinh(String chuanManHinh) {
		this.chuanManHinh = chuanManHinh;
	}

	public Float getKichThuocManHinh() {
		return this.kichThuocManHinh;
	}

	public void setKichThuocManHinh(Float kichThuocManHinh) {
		this.kichThuocManHinh = kichThuocManHinh;
	}

	public String getCamUng() {
		return this.camUng;
	}

	public void setCamUng(String camUng) {
		this.camUng = camUng;
	}

	public String getMatDoDiemAnh() {
		return this.matDoDiemAnh;
	}

	public void setMatDoDiemAnh(String matDoDiemAnh) {
		this.matDoDiemAnh = matDoDiemAnh;
	}

	public String getCameraSau() {
		return this.cameraSau;
	}

	public void setCameraSau(String cameraSau) {
		this.cameraSau = cameraSau;
	}

	public String getCameraTruoc() {
		return this.cameraTruoc;
	}

	public void setCameraTruoc(String cameraTruoc) {
		this.cameraTruoc = cameraTruoc;
	}

	public String getTinhNangCamera() {
		return this.tinhNangCamera;
	}

	public void setTinhNangCamera(String tinhNangCamera) {
		this.tinhNangCamera = tinhNangCamera;
	}

	public String getQuayPhim() {
		return this.quayPhim;
	}

	public void setQuayPhim(String quayPhim) {
		this.quayPhim = quayPhim;
	}

	public Boolean getVideoCall() {
		return this.videoCall;
	}

	public void setVideoCall(Boolean videoCall) {
		this.videoCall = videoCall;
	}

	public Float getTocDoCpu() {
		return this.tocDoCpu;
	}

	public void setTocDoCpu(Float tocDoCpu) {
		this.tocDoCpu = tocDoCpu;
	}

	public Short getSoNhanCpu() {
		return this.soNhanCpu;
	}

	public void setSoNhanCpu(Short soNhanCpu) {
		this.soNhanCpu = soNhanCpu;
	}

	public String getChipset() {
		return this.chipset;
	}

	public void setChipset(String chipset) {
		this.chipset = chipset;
	}

	public String getRam() {
		return this.ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getGpu() {
		return this.gpu;
	}

	public void setGpu(String gpu) {
		this.gpu = gpu;
	}

	public String getBoNhoTrong() {
		return this.boNhoTrong;
	}

	public void setBoNhoTrong(String boNhoTrong) {
		this.boNhoTrong = boNhoTrong;
	}

	public String getTheNhoNgoai() {
		return this.theNhoNgoai;
	}

	public void setTheNhoNgoai(String theNhoNgoai) {
		this.theNhoNgoai = theNhoNgoai;
	}

	public Short getDungLuongTheToiDa() {
		return this.dungLuongTheToiDa;
	}

	public void setDungLuongTheToiDa(Short dungLuongTheToiDa) {
		this.dungLuongTheToiDa = dungLuongTheToiDa;
	}

	public Float getDungLuongPin() {
		return this.dungLuongPin;
	}

	public void setDungLuongPin(Float dungLuongPin) {
		this.dungLuongPin = dungLuongPin;
	}

	public String getCongNghePin() {
		return this.congNghePin;
	}

	public void setCongNghePin(String congNghePin) {
		this.congNghePin = congNghePin;
	}

	public Boolean getPinCoTheThaoRoi() {
		return this.pinCoTheThaoRoi;
	}

	public void setPinCoTheThaoRoi(Boolean pinCoTheThaoRoi) {
		this.pinCoTheThaoRoi = pinCoTheThaoRoi;
	}

	public Float getThoiGianChoToiDa() {
		return this.thoiGianChoToiDa;
	}

	public void setThoiGianChoToiDa(Float thoiGianChoToiDa) {
		this.thoiGianChoToiDa = thoiGianChoToiDa;
	}

	public Float getThoiGianChoQuayPhim() {
		return this.thoiGianChoQuayPhim;
	}

	public void setThoiGianChoQuayPhim(Float thoiGianChoQuayPhim) {
		this.thoiGianChoQuayPhim = thoiGianChoQuayPhim;
	}

	public Float getThoiGianChoGoiDien() {
		return this.thoiGianChoGoiDien;
	}

	public void setThoiGianChoGoiDien(Float thoiGianChoGoiDien) {
		this.thoiGianChoGoiDien = thoiGianChoGoiDien;
	}

	public String getMang2g() {
		return this.mang2g;
	}

	public void setMang2g(String mang2g) {
		this.mang2g = mang2g;
	}

	public String getMang3g() {
		return this.mang3g;
	}

	public void setMang3g(String mang3g) {
		this.mang3g = mang3g;
	}

	public String getMang4g() {
		return this.mang4g;
	}

	public void setMang4g(String mang4g) {
		this.mang4g = mang4g;
	}

	public String getWifi() {
		return this.wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public String getBluetooth() {
		return this.bluetooth;
	}

	public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getGprs() {
		return this.gprs;
	}

	public void setGprs(String gprs) {
		this.gprs = gprs;
	}

	public Short getSoLuongSim() {
		return this.soLuongSim;
	}

	public void setSoLuongSim(Short soLuongSim) {
		this.soLuongSim = soLuongSim;
	}

	public String getGps() {
		return this.gps;
	}

	public void setGps(String gps) {
		this.gps = gps;
	}

	public String getBoCamBien() {
		return this.boCamBien;
	}

	public void setBoCamBien(String boCamBien) {
		this.boCamBien = boCamBien;
	}

	public String getDenFlash() {
		return this.denFlash;
	}

	public void setDenFlash(String denFlash) {
		this.denFlash = denFlash;
	}

	public String getDenPin() {
		return this.denPin;
	}

	public void setDenPin(String denPin) {
		this.denPin = denPin;
	}

}