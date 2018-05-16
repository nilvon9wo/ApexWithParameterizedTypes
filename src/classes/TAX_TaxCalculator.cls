// @see https://www.javaspecialists.eu/archive/Issue123.html
public class TAX_TaxCalculator {
	TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper; 
	TAX_XTOR_TaxStrategyLookUp taxStrategyLookUp;

	// Singleton
	@testVisible private static TAX_TaxCalculator instance;
	public static TAX_TaxCalculator getInstance() {
		if (instance == null) {
			instance = new TAX_TaxCalculator();		
		}
		return instance;
	}
	
    @testVisible
	private TAX_TaxCalculator(
    		TAX_TaxPayerTypeEnumHelper taxPayerTypeEnumHelper, 
    		TAX_XTOR_TaxStrategyLookUp taxStrategyLookUp
    	) {
    	this.taxPayerTypeEnumHelper = taxPayerTypeEnumHelper;
    	this.taxStrategyLookUp = taxStrategyLookUp; 
    }
     
    @testVisible 
	private TAX_TaxCalculator() {
    	this(
    		TAX_TaxPayerTypeEnumHelper.getInstance(), 
    		TAX_XTOR_TaxStrategyLookUp.getInstance()
    	); 
    } 
    
    // -----------------------------------------------------------------------------
     
    public Double extortCash(TAX_PAYR_TaxPayerIntf taxPayer) {
    	return this.taxStrategyLookUp
    		.get(this.taxPayerTypeEnumHelper.getTypeFrom(taxPayer))
    		.extortCash(taxPayer);
    }
}