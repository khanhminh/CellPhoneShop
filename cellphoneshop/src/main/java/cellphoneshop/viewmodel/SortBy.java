package cellphoneshop.viewmodel;

public class SortBy {
	private String by;
	private boolean asc;
	private String title;
	
	public SortBy(){
		by = "price";
		asc = true;
	}
	
	public SortBy(String by, boolean isAsc){
		this.by = by;
		this.asc = isAsc;
	}
	
	public String getBy() {
		return by;
	}

	public void setBy(String by) {
		this.by = by;
	}

	public boolean isAsc() {
		return asc;
	}
	
	public void setAsc(boolean asc) {
		this.asc = asc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getCode(){
		String s = asc ? "asc" : "desc";
		
		return by + "_" + s;
	}
	
}
