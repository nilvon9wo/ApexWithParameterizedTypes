public virtual class UTIL_JsonHelper {
	
	// Singleton
	@testVisible private static UTIL_JsonHelper instance;
	public static UTIL_JsonHelper getInstance() {
		if (instance == null) {
			instance = new UTIL_JsonHelper();		
		}
		return instance;
	}

	@testVisible
	private UTIL_JsonHelper() {
	}
	
	// --------------------------------------------------------------------------------
	
    public virtual String serialize(Object obj) {
    	return System.JSON.serialize(obj);
    }

    public virtual Object deserialize(String jsonString, Type classType) {
    	return System.JSON.deserialize(jsonString, classType);
    }
}