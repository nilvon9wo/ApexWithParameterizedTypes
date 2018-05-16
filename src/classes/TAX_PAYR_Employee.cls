public virtual class TAX_PAYR_Employee extends TAX_PAYR_TaxPayerAbs {
	TAX_GenderEnumHelper genderEnumHelper;
    
    public TAX_PAYR_Employee(Tax_Payer__c taxPayer, TAX_GenderEnumHelper genderHelper) {
    	this.taxPayer = taxPayer;
    	this.genderEnumHelper = genderEnumHelper;
    }  
        
    public TAX_PAYR_Employee(Tax_Payer__c taxPayer) {
    	this(taxPayer, TAX_GenderEnumHelper.getInstance());
    }       
    
    public Boolean isMarried() {
    	return taxPayer.Is_Married__c;
    }
    
    public TAX_GenderEnum getGender() {
    	return this.genderEnumHelper.getTypeFrom(this.taxPayer);
    }
}