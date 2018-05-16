public class PAIR_StringPair implements PAIR_DoubleUpIntf<String>{
   	private String string1;
   	private String string2;
   	public PAIR_StringPair(String string1, String string2) {
   		this.string1 = string1;
   		this.string2 = string2;
   	}
   	
   	public String getFirst(){
   		return this.string1;
   	}

   	public String getSecond(){
   		return this.string1;
   	}
   	
   	public void setFirst(String value) {
   		this.string1 = value;
   	}

   	public void setSecond(String value) {
   		this.string2 = value;
   	}

	public PAIR_PairIntf<String, String> swap() {
		return new PAIR_StringPair(this.string2, this.string1);
	}
}