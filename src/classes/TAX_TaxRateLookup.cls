public virtual class TAX_TaxRateLookup {
	DAO_TaxRateSelector taxRateSelector; 
	TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper;
	
	// Singleton
	@testVisible private static TAX_TaxRateLookup instance;
	public static TAX_TaxRateLookup getInstance() {
		if (instance == null) {
			instance = new TAX_TaxRateLookup();		
		}
		return instance;
	}

	@testVisible
	private TAX_TaxRateLookup(DAO_TaxRateSelector taxRateSelector, TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper) {
		this.taxRateSelector = taxRateSelector;
		this.taxPayerTypeEnumHelper = taxPayerTypeEnumHelper;
	}

	@testVisible
	private TAX_TaxRateLookup() {
		this(DAO_TaxRateSelector.getInstance(), TAX_TaxPayerTypeEnumHelper.getInstance());
	} 
	
	// --------------------------------------------------------------------------------	 

    private static Map<String, Decimal> PAYER_RATE_BY_NAME_MAP;
    private static Map<TAX_TaxPayerTypeEnum, Decimal> PAYER_RATE_BY_TYPE_MAP;
	
	public Decimal get(TAX_TaxPayerTypeEnum taxPayerType) {
		if (PAYER_RATE_BY_TYPE_MAP == null) {
			this.buildPayerRateMaps();
		}
		return PAYER_RATE_BY_TYPE_MAP.get(taxPayerType); 
	}
	
	public Decimal get(String rateName) {
		if (PAYER_RATE_BY_NAME_MAP == null) {
			this.buildPayerRateMaps();
		}
		return PAYER_RATE_BY_NAME_MAP.get(rateName);  
	}

	// --------------------------------------------------------------------------------	 

	@testVisible
	private List<Tax_Rate__mdt> buildPayerRateMaps() {
		Map<TAX_TaxPayerTypeEnum, Decimal> rateByPayerType = new Map<TAX_TaxPayerTypeEnum, Decimal>();
		Map<String, Decimal> rateByName = new Map<String, Decimal>();
		
		List<Tax_Rate__mdt> taxRateList = this.taxRateSelector.selectAll(); 
		for(Tax_Rate__mdt rate : taxRateList) {
   			rateByName.put(rate.DeveloperName, rate.Percent__c);

			TAX_TaxPayerTypeEnum payerType = this.taxPayerTypeEnumHelper.convertToEnumFor(rate.DeveloperName);
			if (payerType != null) {
				rateByPayerType.put(payerType, rate.Percent__c);
			}
   		}
   		
   		PAYER_RATE_BY_NAME_MAP = rateByName;
   		PAYER_RATE_BY_TYPE_MAP = rateByPayerType;
		return taxRateList;
	}
}