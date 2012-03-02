require File.expand_path('../helper', __FILE__)
	
class TestOS < MiniTest::Should::TestCase
  
  should "be on mac" do
  	request = get_request(:Chrome, '8.0.552.237')
  	assert request.mac?
  end
  
  should "be on pc" do
  	request = get_request(:IE, '6.0')
  	assert request.pc?
  end
  
  should "be on linux" do
  	request = get_request(:Chrome, '4.0.202.2')  	
  	assert request.linux?
  end
  
  should "be on mobile" do
  	request = get_request(:MobileSafari, 'iPhone')  	
  	assert request.mobile?
  end
  
end