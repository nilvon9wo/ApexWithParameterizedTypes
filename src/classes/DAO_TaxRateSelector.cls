public class DAO_TaxRateSelector {
	// Singleton
	@testVisible private static DAO_TaxRateSelector instance;
	public static DAO_TaxRateSelector getInstance() {
		if (instance == null) {
			instance = new DAO_TaxRateSelector();		
		} 
		return instance;
	}

	@testVisible
	private DAO_TaxRateSelector() {
	}
	
	// --------------------------------------------------------------------------------	 

    public List<Tax_Rate__mdt> selectAll() {
    	return [
    		SELECT DeveloperName, Percent__c
    		FROM Tax_Rate__mdt
    	];
    }
}