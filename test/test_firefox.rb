require File.expand_path('../helper', __FILE__)
	
class TestFirefox < MiniTest::Should::TestCase

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
  
end