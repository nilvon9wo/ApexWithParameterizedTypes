// @see https://www.javaspecialists.eu/archive/Issue123.html
public class TAX_RevenueReceiver {
    	TAX_PAYR_TaxPayerFactory taxPayerFactory;
    	TAX_TaxCalculator taxCalculator;
    	TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper;
    	
	public TAX_RevenueReceiver(
			TAX_PAYR_TaxPayerFactory taxPayerFactory,
			TAX_TaxCalculator taxCalculator, 
			TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper
		){
		this.taxPayerFactory = taxPayerFactory;
		this.taxCalculator = taxCalculator;
		this.taxPayerTypeEnumHelper = taxPayerTypeEnumHelper;
	}
	
	public TAX_RevenueReceiver(){
		this(
			TAX_PAYR_TaxPayerFactory.getInstance(),
			TAX_TaxCalculator.getInstance(), 
			TAX_TaxPayerTypeEnumHelper.getInstance()
		);
	}
	
    public static void main() {
    	(new TAX_RevenueReceiver()).extort(); 
    }

    @testVisible
    private Map<TAX_PAYR_TaxPayerIntf, Decimal> extort() {
    	return this.extort(this.createTaxPayerList());
    } 

    @testVisible
    private Map<TAX_PAYR_TaxPayerIntf, Decimal> extort(List<TAX_PAYR_TaxPayerIntf> taxPayerList) {
    	Map<TAX_PAYR_TaxPayerIntf, Decimal> taxByTaxPayerMap = new Map<TAX_PAYR_TaxPayerIntf, Decimal>();
    	for (TAX_PAYR_TaxPayerIntf taxPayer : taxPayerList) {
    		Decimal rate = taxCalculator.extortCash(taxPayer); 
    		taxByTaxPayerMap.put(taxPayer, rate);  
    		System.debug('### ' + taxPayer.getName() + ' : ' + rate);
    	}  
    	return taxByTaxPayerMap;
    }    
    
    @testVisible
    private Id getRecordTypeIdFor(TAX_TaxPayerTypeEnum payerType) {
    	return this.taxPayerTypeEnumHelper.convertToIdFor(payerType);
    } 

	// Dummy data ------------------------------------------------------------------------------------
    
    private List<TAX_PAYR_TaxPayerIntf> createTaxPayerList(){
    	return new List<TAX_PAYR_TaxPayerIntf>{
    		//				 	Name		Income		Type
    		this.createTaxPayer('Heinz',   	 50000, 	TAX_TaxPayerTypeEnum.EMPLOYEE),
    		this.createTaxPayer('Maxsol',  	100000, 	TAX_TaxPayerTypeEnum.COMPANY),
    		this.createTaxPayer('Family',  	 30000, 	TAX_TaxPayerTypeEnum.TRUST)
    	};
    }
    
    @testVisible
    private TAX_PAYR_TaxPayerIntf createTaxPayer(String name, Integer income, TAX_TaxPayerTypeEnum payerType){
    	return this.taxPayerFactory.createFor(new Tax_Payer__c(
    		Name__c = name, 
    		Income__c = income, 
    		RecordTypeId = this.getRecordTypeIdFor(payerType)
    	));
    }
}