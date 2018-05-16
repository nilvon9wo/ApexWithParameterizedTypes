public virtual class TAX_PAYR_TaxPayerAbs implements TAX_PAYR_TaxPayerIntf {
    protected Tax_Payer__c taxPayer; 
    
    protected TAX_PAYR_TaxPayerAbs(Tax_Payer__c taxPayer) {
    	this.taxPayer = taxPayer;
    }
    
    protected TAX_PAYR_TaxPayerAbs() {
    }
    
    public String getName() {
    	return this.taxPayer.Name__c; 
    }
     
    public Id getRecordTypeId(){
    	return this.taxPayer.RecordTypeId;
    }
     
    public Double getIncome() { 
    	return this.taxPayer.Income__c;
    }
}