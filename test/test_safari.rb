require_relative 'helper'
	
class TestSafari < Test::Unit::TestCase

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
  
  # mobile safari tests
  
  should "be safari ipad" do
  	request = get_request(:MobileSafari, 'iPad')
  	assert !request.safari?
  	assert request.mobile_safari?
  	assert request.ipad?
  end
  
  should "be safari ipod" do
  	request = get_request(:MobileSafari, 'iPod')  	
  	assert !request.safari?
  	assert request.mobile_safari?
  	assert request.ipod?
  end
  
  should "be safari iphone" do
  	request = get_request(:MobileSafari, 'iPhone')  	
  	assert !request.safari?
  	assert request.mobile_safari?
  	assert request.iphone?
  end
  
end