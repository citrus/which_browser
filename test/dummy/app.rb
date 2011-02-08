require 'rubygems'
require 'ramaze'

require File.expand_path("../../../lib/which_browser", __FILE__)

class MainController < Ramaze::Controller
  def index
    {  
    
      "USER AGENT"     => request.user_agent,
      "IE"             => request.ie?,
      "IE 6?"          => request.ie6?,
      "IE 7?"          => request.ie7?,
      "IE LT 6?"       => request.ie_lt6?,
      "IE LT 7?"       => request.ie_lt7?,
      "IE GT 7?"       => request.ie_gt7?,
      "IE LTE 6?"      => request.ie_lte6?,
      "IE LTE 7?"      => request.ie_lte7?,
      "IE GTE 7?"      => request.ie_gte7?
    }.to_a.collect!{ |key,value|
      "#{key}: \t\t #{value}"
    }.join("<br/>")
  end
end

Ramaze.start(:mode => :dev)