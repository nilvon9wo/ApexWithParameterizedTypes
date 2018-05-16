public virtual class TAX_GenderEnumHelper {
	// Singleton
	@testVisible private static TAX_GenderEnumHelper instance;
	public static TAX_GenderEnumHelper getInstance() {
		if (instance == null) {
			instance = new TAX_GenderEnumHelper();		
		}
		return instance;
	}

	@testVisible
	private TAX_GenderEnumHelper() {
	}
	
	// --------------------------------------------------------------------------------	     

	private static final List<Schema.PicklistEntry> GENDER_PICKLIST = Tax_Payer__c.Gender__c.getDescribe().getPicklistValues();
	
    public static Map<String, TAX_GenderEnum> GENDER_BY_NAME_MAP { 
    	get {
    		if (GENDER_BY_NAME_MAP == null) {
	    		GENDER_BY_NAME_MAP = new Map<String, TAX_GenderEnum>();
	    		for(TAX_GenderEnum genderType : TAX_GenderEnum.values()) {
	    			GENDER_BY_NAME_MAP.put(genderType.name(), genderType);
	    		}
    		}
	    	return GENDER_BY_NAME_MAP;
    	} 
    	private set;
    }
	
    public virtual TAX_GenderEnum getTypeFrom(Tax_Payer__c taxPayer) {
    	return this.convertToEnumFor(taxPayer.Gender__c);
    }

    public virtual TAX_GenderEnum convertToEnumFor(String genderName) {
    	return GENDER_BY_NAME_MAP.get(genderName.toUpperCase());
    }

    public virtual String convertToStringFor(TAX_GenderEnum value) {
    	return value.name();
    }
}