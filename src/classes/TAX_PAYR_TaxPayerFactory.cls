public virtual class TAX_PAYR_TaxPayerFactory {
	TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper;
	UTIL_JsonHelper jsonHelper;
	
	// Singleton
	@testVisible private static TAX_PAYR_TaxPayerFactory instance;
	public static TAX_PAYR_TaxPayerFactory getInstance() {
		if (instance == null) {
			instance = new TAX_PAYR_TaxPayerFactory();		
		}
		return instance;
	}

	@testVisible
	private TAX_PAYR_TaxPayerFactory(TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper, UTIL_JsonHelper jsonHelper) {
		this.taxPayerTypeEnumHelper = taxPayerTypeEnumHelper;
		this.jsonHelper = jsonHelper;
	}
	
	@testVisible
	private TAX_PAYR_TaxPayerFactory() {
		this(TAX_TaxPayerTypeEnumHelper.getInstance(), UTIL_JsonHelper.getInstance());
	} 
	
	// --------------------------------------------------------------------------------
	
	private static final Map<TAX_TaxPayerTypeEnum, Type> TAX_PAYER_TYPE_CLASS_BY_ENUM_MAP = new Map<TAX_TaxPayerTypeEnum, Type>{
		TAX_TaxPayerTypeEnum.COMPANY => TAX_PAYR_Company.class,
		TAX_TaxPayerTypeEnum.EMPLOYEE => TAX_PAYR_Employee.class,
		TAX_TaxPayerTypeEnum.TRUST => TAX_PAYR_Trust.class
	};

    public TAX_PAYR_TaxPayerIntf createFor(Tax_Payer__c taxPayer) {
    	TAX_TaxPayerTypeEnum payerTypeEnum = this.taxPayerTypeEnumHelper.getTypeFrom(taxPayer);
    	Type payerTypeClass = TAX_PAYER_TYPE_CLASS_BY_ENUM_MAP.get(payerTypeEnum);
    	
    	String taxPayerJson = '{"taxPayer":' +  this.jsonHelper.serialize(taxPayer) + '}';
    	return (TAX_PAYR_TaxPayerIntf) this.jsonHelper.deserialize(taxPayerJson, payerTypeClass);
    }
}