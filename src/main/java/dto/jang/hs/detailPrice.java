package dto.jang.hs;

public class detailPrice {

	
	private String PRODCD;
	private String TRADE_DT;
	private String TRADE_TM;
	private long PRICE;
	
	
	public String getPRODCD() {
		return PRODCD;
	}
	public void setPRODCD(String PRODCD) {
		if(PRODCD.equals("B034")) {
			this.PRODCD="고급 휘발유";
		}
		else if(PRODCD.equals("B027"))
		{
			this.PRODCD="보통 휘발유";	
		}
		else if(PRODCD.equals("D047"))
		{
			this.PRODCD="자동차 경유";
		}
		else if(PRODCD.equals("C004"))
		{
			this.PRODCD="실내 등유";
		}
		else if(PRODCD.equals("K015"))
		{
			this.PRODCD="자동차 부탄";
		}
	}
	public String getTRADE_DT() {
		return TRADE_DT;
	}
	public void setTRADE_DT(String tRADE_DT) {
		TRADE_DT = tRADE_DT;
	}
	public String getTRADE_TM() {
		return TRADE_TM;
	}
	public void setTRADE_TM(String tRADE_TM) {
		TRADE_TM = tRADE_TM;
	}
	public long getPRICE() {
		return PRICE;
	}
	public void setPRICE(long pRICE) {
		PRICE = pRICE;
	}
	@Override
	public String toString() {
		return "DetailPrice [PRODCD=" + PRODCD + ", TRADE_DT=" + TRADE_DT + ", TRADE_TM=" + TRADE_TM + ", PRICE="
				+ PRICE + "]";
	}
	
	
	
	
	
}
