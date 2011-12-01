require_relative 'helper'
	
class TestRequests < MiniTest::Unit::TestCase
  
  should "return test user agent" do
  	request = get_request(:Safari, '4.0.1') 	
  	assert_equal true, request.test_user_agent(/Safari/)
  end
  
end