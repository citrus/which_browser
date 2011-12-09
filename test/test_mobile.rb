require File.expand_path('../helper', __FILE__)
	
class TestMobile < MiniTest::Unit::TestCase
  
  should "be safari ipad" do
  	request = get_request(:MobileSafari, 'iPad')
  	assert !request.safari?
  	assert request.mobile_safari?
  	assert request.ipad?
  	assert request.mobile?
  end
  
  should "be safari ipod" do
  	request = get_request(:MobileSafari, 'iPod')  	
  	assert !request.safari?
  	assert request.mobile_safari?
  	assert request.ipod?
  	assert request.mobile?
  end
  
  should "be safari iphone" do
  	request = get_request(:MobileSafari, 'iPhone')  	
  	assert !request.safari?
  	assert request.mobile_safari?
  	assert request.iphone?
  	assert request.mobile?
  end

  should "be blackberry" do
  	request = get_request(:BlackBerry, '7.0.0.296')
  	assert request.blackberry?
  	assert request.mobile?
  end
  
  should "be symbian" do
  	request = get_request(:Symbian, '10.0.018')
  	assert request.symbian?
  	assert request.mobile?
  end
  
end
