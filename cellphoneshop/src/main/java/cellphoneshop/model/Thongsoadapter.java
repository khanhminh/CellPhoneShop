package cellphoneshop.model;

// Generated Dec 10, 2013 11:05:38 PM by Hibernate Tools 3.4.0.CR1

/**
 * Thongsoadapter generated by hbm2java
 */
public class Thongsoadapter implements java.io.Serializable {

	private Long maThongSoAdapter;
	private Ctsanpham ctsanpham;
	private String inputAc;
	private String outputDc;
	private String kieuGiacCam;

	public Thongsoadapter() {
	}

	public Thongsoadapter(Ctsanpham ctsanpham) {
		this.ctsanpham = ctsanpham;
	}

	public Thongsoadapter(Ctsanpham ctsanpham, String inputAc, String outputDc,
			String kieuGiacCam) {
		this.ctsanpham = ctsanpham;
		this.inputAc = inputAc;
		this.outputDc = outputDc;
		this.kieuGiacCam = kieuGiacCam;
	}

	public Long getMaThongSoAdapter() {
		return this.maThongSoAdapter;
	}

	public void setMaThongSoAdapter(Long maThongSoAdapter) {
		this.maThongSoAdapter = maThongSoAdapter;
	}

	public Ctsanpham getCtsanpham() {
		return this.ctsanpham;
	}

	public void setCtsanpham(Ctsanpham ctsanpham) {
		this.ctsanpham = ctsanpham;
	}

	public String getInputAc() {
		return this.inputAc;
	}

	public void setInputAc(String inputAc) {
		this.inputAc = inputAc;
	}

	public String getOutputDc() {
		return this.outputDc;
	}

	public void setOutputDc(String outputDc) {
		this.outputDc = outputDc;
	}

	public String getKieuGiacCam() {
		return this.kieuGiacCam;
	}

	public void setKieuGiacCam(String kieuGiacCam) {
		this.kieuGiacCam = kieuGiacCam;
	}

}