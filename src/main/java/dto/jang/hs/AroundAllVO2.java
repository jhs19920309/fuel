package dto.jang.hs;

public class AroundAllVO2 {
	
	private String uni_id;
	private String poll_div_co;
	private String os_nm;
	private long price;
	private double distance;
	
	public String getUni_id() {
		return uni_id;
	}
	public void setUni_id(String uni_id) {
		this.uni_id = uni_id;
	}
	public String getPoll_div_co() {
		return poll_div_co;
	} 
	public void setPoll_div_co(String poll_div_co) {
		this.poll_div_co = poll_div_co;
	}
	public String getOs_nm() {
		return os_nm;
	}
	public void setOs_nm(String os_nm) {
		this.os_nm = os_nm;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	@Override
	public String toString() {
		return "AroundAllVO [uni_id=" + uni_id + ", poll_div_co=" + poll_div_co + ", os_nm=" + os_nm + ", price="
				+ price + ", distance=" + distance + "]";
	}
	
	
}
