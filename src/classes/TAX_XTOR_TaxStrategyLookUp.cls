public class TAX_XTOR_TaxStrategyLookUp {

	// Singleton
	@testVisible private static TAX_XTOR_TaxStrategyLookUp instance;
	public static TAX_XTOR_TaxStrategyLookUp getInstance() {
		if (instance == null) {
			instance = new TAX_XTOR_TaxStrategyLookUp();		
		}
		return instance;
	}

	private TAX_XTOR_TaxStrategyLookUp() {
	}
	
	// ---------------------------------------------------------------------------
    
    private static final Map<TAX_TaxPayerTypeEnum, Type> STRATEGY_TYPE_BY_PAYER_TYPE_MAP = new Map<TAX_TaxPayerTypeEnum, Type>{
		TAX_TaxPayerTypeEnum.COMPANY => TAX_XTOR_CompanyTaxStrategy.class, 
		TAX_TaxPayerTypeEnum.EMPLOYEE => TAX_XTOR_EmployeeTaxStrategy.class,
		TAX_TaxPayerTypeEnum.TRUST => TAX_XTOR_TrustTaxStrategy.class 
	};
	
	private static final Map<TAX_TaxPayerTypeEnum, TAX_XTOR_TaxStrategyIntf<TAX_PAYR_TaxPayerIntf>> STRATEGY_INSTANCE_BY_PAYER_TYPE_MAP 
		= new Map<TAX_TaxPayerTypeEnum, TAX_XTOR_TaxStrategyIntf<TAX_PAYR_TaxPayerIntf>>();  
    
    
    public TAX_XTOR_TaxStrategyIntf<TAX_PAYR_TaxPayerIntf> get(TAX_TaxPayerTypeEnum payerType) {
    	if (STRATEGY_INSTANCE_BY_PAYER_TYPE_MAP.get(payerType) == null) {
    		Type strategyType = STRATEGY_TYPE_BY_PAYER_TYPE_MAP.get(payerType);
    		TAX_XTOR_TaxStrategyIntf<TAX_PAYR_TaxPayerIntf> strategyInstance = (TAX_XTOR_TaxStrategyIntf<TAX_PAYR_TaxPayerIntf>) strategyType.newInstance();
    		STRATEGY_INSTANCE_BY_PAYER_TYPE_MAP.put(payerType, strategyInstance);
    	}
    	return STRATEGY_INSTANCE_BY_PAYER_TYPE_MAP.get(payerType);
    } 
}