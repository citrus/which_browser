require File.expand_path('../helper', __FILE__)
	
class TestSafari < MiniTest::Should::TestCase

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
    
end