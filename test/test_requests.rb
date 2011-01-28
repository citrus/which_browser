require_relative 'helper'
	
class TestRequests < Test::Unit::TestCase

  # safari tests

  should "be safari on mac" do
  	request = get_request(:Safari, '4.0.1')
  	assert request.safari?
  	assert request.mac?
  end

  should "be safari on windows" do
  	request = get_request(:Safari, '4.0.3')  	
  	assert request.safari?
  	assert request.pc?
  end
  
  
  # firefox tests
  
  should "be firefox on mac" do
  	request = get_request(:Firefox, '3.6')  	
  	assert request.firefox?
  	assert request.mac?
  end

  should "be firefox on pc" do
  	request = get_request(:Firefox, '3.1')  	
  	assert request.firefox?
  	assert request.pc?
  end
  
  should "be firefox on linux" do
  	request = get_request(:Firefox, '3.5')  	
  	assert request.firefox?
  	assert request.linux?
  end
  
  
  # chrome tests
  
  should "be chrome on mac" do
  	request = get_request(:Chrome, '8.0.552.237')  	
  	assert request.chrome?
  	assert request.mac?
  end

  should "be chrome on pc" do
  	request = get_request(:Chrome, '0.2.149.30')  	
  	assert request.chrome?
  	assert request.pc?
  end
  
  should "be chrome on linux" do
  	request = get_request(:Chrome, '4.0.202.2')  	
  	assert request.chrome?
  	assert request.linux?
  end
  
  
  # ie tests
  
  should "be ie 5" do
  	request = get_request(:IE, '5.5')  	
  	assert request.ie?
  	assert request.ie5?
  	assert request.pc?
  end

  should "be ie 6" do
  	request = get_request(:IE, '6.0')  	
  	assert request.ie?
  	assert request.ie6?
  	assert request.pc?
  end

  should "be ie 7" do
  	request = get_request(:IE, '7.0b')  	
  	assert request.ie?
  	assert request.ie7?
  	assert request.pc?
  end
  
  should "be ie 8" do
  	request = get_request(:IE, '8.0') 	
  	assert request.ie?
  	assert request.ie8?
  	assert request.pc?
  end
  
end