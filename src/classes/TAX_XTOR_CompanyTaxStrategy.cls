public class TAX_XTOR_CompanyTaxStrategy implements TAX_XTOR_TaxStrategyIntf{
    TAX_TaxRateLookup taxRateLookup;
    
    public TAX_XTOR_CompanyTaxStrategy(TAX_TaxRateLookup taxRateLookup) {
    	this.taxRateLookup = taxRateLookup; 
    }

    public TAX_XTOR_CompanyTaxStrategy() {
    	this(TAX_TaxRateLookup.getInstance()); 
    }
    
    public Double extortCash(TAX_PAYR_TaxPayerIntf taxPayer) {
    	return taxPayer.getIncome() * this.taxRateLookup.get(TAX_TaxPayerTypeEnum.COMPANY);
    }
}