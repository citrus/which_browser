require_relative 'helper'
	
class TestInternetExplorer < Test::Unit::TestCase
  
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
  
end