require 'rubygems'
require 'ramaze'

require File.expand_path("../../../lib/which_browser", __FILE__)

class MainController < Ramaze::Controller
  def index
    
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
      :ff?, 
      :ff_version,
      :opera?,
      :chrome?,
      :chrome?,
      :pc?,
      :mac?,
      :linux?
    ].collect{ |method|
      v = request.send(method)
      %(#{method} &nbsp; <span style="color: #{v == false ? 'red' : 'green' }; font-weight: #{v == false ? 'normal' : 'bold'}">#{v}</span>)
    }.join("<br/>")
  end
end

Ramaze.start(:mode => :dev)