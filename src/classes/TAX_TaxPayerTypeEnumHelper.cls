public virtual class TAX_TaxPayerTypeEnumHelper {
	// Singleton
	@testVisible private static TAX_TaxPayerTypeEnumHelper instance;
	public static TAX_TaxPayerTypeEnumHelper getInstance() {
		if (instance == null) {
			instance = new TAX_TaxPayerTypeEnumHelper();		
		}
		return instance;
	}

	@testVisible
	private TAX_TaxPayerTypeEnumHelper() {
	}
	
	// --------------------------------------------------------------------------------	 
	
	private static final Schema.DescribeSObjectResult TAX_PAYER_DESCRIPTION = Tax_Payer__c.SObjectType.getDescribe();
	private static final Map<String, Schema.RecordTypeInfo> TAX_PAYER_RECORD_TYPE_INFO_BY_NAME_MAP = TAX_PAYER_DESCRIPTION.getRecordTypeInfosByName();
	private static final Map<Id, Schema.RecordTypeInfo> TAX_PAYER_RECORD_TYPE_INFO_BY_ID_MAP = TAX_PAYER_DESCRIPTION.getRecordTypeInfosById();

    public static Map<String, TAX_TaxPayerTypeEnum> PAYER_TYPE_BY_NAME_MAP { 
    	get {
    		if (PAYER_TYPE_BY_NAME_MAP == null) {
	    		PAYER_TYPE_BY_NAME_MAP = new Map<String, TAX_TaxPayerTypeEnum>();
	    		for(TAX_TaxPayerTypeEnum payerType : TAX_TaxPayerTypeEnum.values()) {
	    			PAYER_TYPE_BY_NAME_MAP.put(payerType.name(), payerType);
	    		}
    		}
	    	return PAYER_TYPE_BY_NAME_MAP;
    	} 
    	private set;
    }
    
    public static Map<TAX_TaxPayerTypeEnum, Id> ID_BY_PAYER_TYPE_MAP {
    	get {
    		if (ID_BY_PAYER_TYPE_MAP == null) {
	    		ID_BY_PAYER_TYPE_MAP = new Map<TAX_TaxPayerTypeEnum, Id>();
	    		for (String name : TAX_PAYER_RECORD_TYPE_INFO_BY_NAME_MAP.keySet()) {
	    			ID_BY_PAYER_TYPE_MAP.put(
	    				PAYER_TYPE_BY_NAME_MAP.get(name.toUpperCase()), 
	    				TAX_PAYER_RECORD_TYPE_INFO_BY_NAME_MAP.get(name).getRecordTypeId()
	    			);
	    		}
    		}
	    	return ID_BY_PAYER_TYPE_MAP; 
    	} 
    	private set;
    } 
  
  
    public virtual TAX_TaxPayerTypeEnum getTypeFrom(TAX_PAYR_TaxPayerIntf taxPayer) {
    	return this.convertToEnumFor(taxPayer.getRecordTypeId());
    }

    public virtual TAX_TaxPayerTypeEnum getTypeFrom(Tax_Payer__c taxPayer) {
    	return this.convertToEnumFor(taxPayer.RecordTypeId);
    }

    public virtual TAX_TaxPayerTypeEnum convertToEnumFor(Id taxPayerTypeRecordTypeId) {
    	return this.convertToEnumFor(TAX_PAYER_RECORD_TYPE_INFO_BY_ID_MAP.get(taxPayerTypeRecordTypeId));  
    }

    public virtual TAX_TaxPayerTypeEnum convertToEnumFor(Schema.RecordTypeInfo recordTypeInfo) {
    	// This will work with API 43.0, not available yet in this org 
		// return this.convertToEnumFor(recordTypeInfo.getDeveloperName());
		
		// This is risky; it only works because currently these values are identical.
    	return this.convertToEnumFor(recordTypeInfo.getName());

    }

    public virtual TAX_TaxPayerTypeEnum convertToEnumFor(RecordType recordType) {
    	return this.convertToEnumFor(recordType.DeveloperName);
    }

    public virtual TAX_TaxPayerTypeEnum convertToEnumFor(String recordTypeName) {
    	return PAYER_TYPE_BY_NAME_MAP.get(recordTypeName.toUpperCase());
    }

    public virtual Id convertToIdFor(TAX_TaxPayerTypeEnum value) {
    	return ID_BY_PAYER_TYPE_MAP.get(value);
    }
}