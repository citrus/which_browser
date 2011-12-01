require_relative 'helper'
	
class TestChrome < MiniTest::Unit::TestCase

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
  
end