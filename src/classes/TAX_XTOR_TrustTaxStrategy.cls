public class TAX_XTOR_TrustTaxStrategy implements TAX_XTOR_TaxStrategyIntf{
    TAX_TaxRateLookup taxRateLookup;
    
    public TAX_XTOR_TrustTaxStrategy(TAX_TaxRateLookup taxRateLookup) {
    	this.taxRateLookup = taxRateLookup; 
    }

    public TAX_XTOR_TrustTaxStrategy() {
    	this(TAX_TaxRateLookup.getInstance()); 
    }
    
    public Double extortCash(TAX_PAYR_TaxPayerIntf taxPayer) {
    	return taxPayer.getIncome() * this.taxRateLookup.get(TAX_TaxPayerTypeEnum.TRUST);
    }
    
}