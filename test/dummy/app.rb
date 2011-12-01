begin
  require 'rubygems'
  require 'sinatra'
rescue LoadError => e
  puts "Please install sinatra before running this demo."
  puts "Try: `gem install sinatra`"
end

require File.expand_path("../../../lib/which_browser", __FILE__)
  
get "/" do
  # add other methods you'd like to see to the list:
  [
    :user_agent,
    :ie?, 
    :ie6?, 
    :ie_lt6?, 
    :ie_lte7?, 
    :ie_gte6?, 
    :safari?, 
    :safari_version,
    :mobile_safari?,
    :ff?, 
    :ff_version,
    :opera?,
    :chrome?,
    :chrome?,
    :pc?,
    :mac?,
    :linux?,
    :mobile?
  ].collect{ |method|
    v = request.send(method)
    %(#{method} &nbsp; <span style="color: #{v == false ? 'red' : 'green' }; font-weight: #{v == false ? 'normal' : 'bold'}">#{v}</span>)
  }.join("<br/>")
end
