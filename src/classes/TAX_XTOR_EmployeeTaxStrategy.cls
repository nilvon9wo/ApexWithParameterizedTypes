public class TAX_XTOR_EmployeeTaxStrategy implements TAX_XTOR_TaxStrategyIntf<TAX_PAYR_Employee>{
    TAX_TaxRateLookup taxRateLookup;
    
    public TAX_XTOR_EmployeeTaxStrategy(TAX_TaxRateLookup taxRateLookup) {
    	this.taxRateLookup = taxRateLookup; 
    }

    public TAX_XTOR_EmployeeTaxStrategy() {
    	this(TAX_TaxRateLookup.getInstance()); 
    }

    public Double extortCash(TAX_PAYR_Employee taxPayer) {
    	Double rate = this.isMarriedFemale(taxPayer)
    		? this.taxRateLookup.get('Married_Female')
    		: this.taxRateLookup.get(TAX_TaxPayerTypeEnum.EMPLOYEE); 
    	
    	return taxPayer.getIncome() * rate;
    }
    
    @testVisible
    private Boolean isMarriedFemale(TAX_PAYR_Employee employee) {
    	return employee.isMarried() && 
    		TAX_GenderEnum.FEMALE.equals(employee.getGender());
    }
    
}