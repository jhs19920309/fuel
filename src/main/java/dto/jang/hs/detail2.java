package dto.jang.hs;

public class detail2 {
	

	private String VAN_ADR;
	private String NEW_ADR;
	private String TEL;
	
	private String POLL_DIV_CD;
	private String OS_NM;
	private String LPG_YN;
	private String MAINT_YN;
	private String CAR_WASH_YN;
	private String KPETRO_YN;
	private String CVS_YN;
	
	private long B034_PRICE;
	private long B027_PRICE;
	private long D047_PRICE;
	private long K015_PRICE;
 
	 

	  
 
	public long getB034_PRICE() {
		return B034_PRICE;
	}

	public void setB034_PRICE(long b034_PRICE) {
		B034_PRICE = b034_PRICE;
	}

	public long getB027_PRICE() {
		return B027_PRICE;
	}

	public void setB027_PRICE(long b027_PRICE) {
		B027_PRICE = b027_PRICE;
	}

	public long getD047_PRICE() {
		return D047_PRICE;
	}

	public void setD047_PRICE(long d047_PRICE) {
		D047_PRICE = d047_PRICE;
	}

	public long getK015_PRICE() {
		return K015_PRICE;
	}

	public void setK015_PRICE(long k015_PRICE) {
		K015_PRICE = k015_PRICE;
	}

	public String getPOLL_DIV_CD() {
		return POLL_DIV_CD;
	}

	public void setPOLL_DIV_CD(String pOLL_DIV_CD) {
		
		if(pOLL_DIV_CD.equals("SKE")) { POLL_DIV_CD="SK에너지";}
		else if(pOLL_DIV_CD.equals("GSC")) { POLL_DIV_CD="GS칼텍스";}
		else if(pOLL_DIV_CD.equals("HDO")) { POLL_DIV_CD="현대오일뱅크";}
		else if(pOLL_DIV_CD.equals("SOL")) { POLL_DIV_CD="S-OIL";}
		else if(pOLL_DIV_CD.equals("RTO")) { POLL_DIV_CD="자영알뜰";}
		else if(pOLL_DIV_CD.equals("RTX")) { POLL_DIV_CD="고속도로 알뜰";}
		else if(pOLL_DIV_CD.equals("NHO")) { POLL_DIV_CD="농협 알뜰";}
		else if(pOLL_DIV_CD.equals("ETC")) { POLL_DIV_CD="자가상표";}
		else if(pOLL_DIV_CD.equals("E1G")) { POLL_DIV_CD="E1";}
		else if(pOLL_DIV_CD.equals("SKG")) { POLL_DIV_CD="SK가스";}
		else {
			POLL_DIV_CD=pOLL_DIV_CD;
		}
		
		
	}

	public String getOS_NM() {
		return OS_NM;
	}

	public void setOS_NM(String oS_NM) {
		OS_NM = oS_NM;
	}

	public String getLPG_YN() {
		return LPG_YN;
	}

	public void setLPG_YN(String lPG_YN) {
		//LPG_YN = lPG_YN;
		if(lPG_YN.equals("N")) { this.LPG_YN="일반 주유소";}
		else if(lPG_YN.equals("Y")) {this.LPG_YN="자동차 충전소";}
		else if(lPG_YN.equals("C")) {this.LPG_YN="주유소 충전소 겸업";}
		
		
	}

	public String getMAINT_YN() {
		return MAINT_YN;
	}

	public void setMAINT_YN(String mAINT_YN) {
		MAINT_YN = mAINT_YN;
	}

	public String getCAR_WASH_YN() {
		return CAR_WASH_YN;
	}

	public void setCAR_WASH_YN(String cAR_WASH_YN) {
		CAR_WASH_YN = cAR_WASH_YN;
	}

	public String getKPETRO_YN() {
		return KPETRO_YN;
	}

	public void setKPETRO_YN(String kPETRO_YN) {
		KPETRO_YN = kPETRO_YN;
	}

	public String getCVS_YN() {
		return CVS_YN;
	}

	public void setCVS_YN(String cVS_YN) {
		CVS_YN = cVS_YN;
	}

	 
	public String getVAN_ADR() {
		return VAN_ADR;
	}

	public void setVAN_ADR(String vAN_ADR) {
		VAN_ADR = vAN_ADR;
	}

	public String getNEW_ADR() {
		return NEW_ADR;
	}

	public void setNEW_ADR(String nEW_ADR) {
		NEW_ADR = nEW_ADR;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}
 

}
