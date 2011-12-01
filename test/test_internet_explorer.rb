require_relative 'helper'
	
class TestInternetExplorer < MiniTest::Unit::TestCase
  
  # ie tests
  
  should "be ie 5" do
  	request = get_request(:IE, '5.5')  	
  	assert request.ie?
  	assert request.old_ie?
  	assert request.ie5?
  	assert request.pc?
  end

  should "be ie 6" do
  	request = get_request(:IE, '6.0')  	
  	assert request.ie?
  	assert request.old_ie?
  	assert request.ie6?
  	assert request.pc?
  end

  should "be ie 7" do
  	request = get_request(:IE, '7.0b')  	
  	assert request.ie?
  	assert !request.old_ie?
  	assert request.ie7?
  	assert request.pc?
  end
  
  should "be ie 8" do
  	request = get_request(:IE, '8.0') 	
  	assert request.ie?
  	assert !request.old_ie?
  	assert request.ie8?
  	assert request.pc?
  end
  
  should "be less than ie 6" do
    request = get_request(:IE, '5.5')    
  	assert !request.ie_lt5?
  	assert request.ie_lt6?
  	assert request.ie_lt7?
  	assert request.ie_lt8?
  	assert request.ie_lt9?
  end
  
  should "be greater than ie 6" do
    request = get_request(:IE, '6.0')
    assert request.ie_gt5?
  	assert !request.ie_gt6?
  	assert !request.ie_gt7?
  	assert !request.ie_gt8?
  	assert !request.ie_gt9? 
  end
  
  should "be greater than or equal to ie 6" do
    request = get_request(:IE, '6.0')
    assert request.ie_gte5?
  	assert request.ie_gte6?
  	assert !request.ie_gte7?
  	assert !request.ie_gte8?
  	assert !request.ie_gte9? 
  end
  
  should "be greater than or equal to ie 8" do
    request = get_request(:IE, '8.0')
    assert request.ie_gte5?
  	assert request.ie_gte6?
  	assert request.ie_gte7?
  	assert request.ie_gte8?
  	assert !request.ie_gte9? 
  end
  
  should "be false if not ie" do
    request = get_request(:Safari, '4.0.1')
    assert !request.ie_lt5?
  	assert !request.ie_gt6?
  	assert !request.ie_lte7?
  	assert !request.ie_gte8?
  end
 
end