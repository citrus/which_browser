require 'rubygems'
require 'minitest/autorun'
require 'minitest/should'
require 'rack'
require 'which_browser'

USER_AGENTS = {}

def register(name, version, os, engine, engine_version, user_agent)
  USER_AGENTS[name] ||= {}
  USER_AGENTS[name][version] = {
    :os             => os,
    :engine         => engine,
    :engine_version => engine_version,
    :user_agent     => user_agent
  }
end

register :Safari, '4.0dp1', :'Windows XP',    :webkit, '526.9',    'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'
register :Safari, '4.0.3',  :'Windows Vista', :webkit, '531.9',    'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-us) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9'
register :Safari, '4.0.2',  :'Windows 7',     :webkit, '532',      'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532+ (KHTML, like Gecko) Version/4.0.2 Safari/530.19.1'
register :Safari, '4.0.1',  :'OS X 10.5',     :webkit, '531.2',    'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_7; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/4.0.1 Safari/530.18'
register :Safari, '4.0',    :'Windows Vista', :webkit, '528.16',   'Mozilla/5.0 (Windows; U; Windows NT 6.0; ru-RU) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16'
register :Safari, '3.2.3',  :'Windows XP',    :webkit, '525.28.3', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; cs-CZ) AppleWebKit/525.28.3 (KHTML, like Gecko) Version/3.2.3 Safari/525.29'

register :MobileSafari, 'iPhone', :'iPhone OS 4_1', :webkit, '6531.22.7', 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7'
register :MobileSafari, 'iPod',   :'iPhone OS 4_1', :webkit, '6531.22.7', 'Mozilla/5.0 (iPod; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7'
register :MobileSafari, 'iPad',   :'OS 3_2_2',      :webkit, '531.21.10', 'Mozilla/5.0 (iPad; U; CPU OS 3_2_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B500 Safari/531.21.10'

register :IE, '8.0',  :'Windows 7',    :msie, '8.0',  'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.2; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)'
register :IE, '7.0b', :'Windows 2003', :msie, '7.0b', 'Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.0.04506.30)'
register :IE, '6.0b', :'Windows XP',   :msie, '6.0b', 'Mozilla/4.0 (compatible; MSIE 6.0b; Windows NT 5.1)'
register :IE, '6.0',  :'Windows XP',   :msie, '6.0',  'Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)'
register :IE, '5.5',  :'Windows 98',   :msie, '4.0',  'Mozilla/4.0 (compatible; MSIE 5.50; Windows NT; SiteKiosk 4.9; SiteCoach 1.0)'


register :Opera, '9.99', :'Windows XP', :presto,  '9.9.9',    'Opera/9.99 (Windows NT 5.1; U; pl) Presto/9.9.9'
register :Opera, '9.70', :Linux,        :gecko,   '20061208', 'Mozilla/5.0 (Linux i686 ; U; en; rv:1.8.1) Gecko/20061208 Firefox/2.0.0 Opera 9.70'
register :Opera, '9.64', :Linux,        :presto,  '2.1.1',    'Opera/9.64 (X11; Linux i686; U; Linux Mint; it) Presto/2.1.1'
register :Opera, '9.00', :Wii,          :unknown,  nil,       'Opera/9.00 (Nintindo Wii; U; ; 103858; Wii Shop Channel/1.0; en)'

register :Chrome, '4.0.202.2',  :Linux,           :webkit, '532.0',  'Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/4.0.202.2 Safari/532.0'
register :Chrome, '0.2.149.27', :'Windows 2003',  :webkit, '525.13', 'Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.27 Safari/525.13'
register :Chrome, '0.2.149.30', :'Windows Vista', :webkit, '525.13', 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.2.149.30 Safari/525.13'
register :Chrome, '8.0.552.237', :'Mac OS X 10_6_6', :webkit, '534.10', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.237 Safari/534.10'



register :Konqueror, '4.2',     :Linux, :khtml,     '4.2.4',    'Mozilla/5.0 (compatible; Konqueror/4.2; Linux; X11; x86_64) KHTML/4.2.4 (like Gecko) Fedora/4.2.4-2.fc11'
register :Konqueror, '3.1-rc6', :Linux, :konqueror, '3.1-rc6', 'Mozilla/5.0 (compatible; Konqueror/3.1-rc6; i686 Linux; 20021105)'

register :PS3, '2.00', :Playstation, :unknown, nil, 'Mozilla/5.0 (PLAYSTATION 3; 2.00)'
register :PS3, '1.10', :Playstation, :unknown, nil, 'Mozilla/5.0 (PLAYSTATION 3; 1.10)'

register :PSP, '2.00', :Playstation, :unknown, nil, 'PSP (PlayStation Portable); 2.00'
register :PSP, '2.00', :Playstation, :unknown, nil, 'Mozilla/4.0 (PSP (PlayStation Portable); 2.00)'

register :Firefox, '3.5', :Linux,         :gecko, '20090624',   'Mozilla/5.0 (X11;U; Linux i686; en-GB; rv:1.9.1) Gecko/20090624 Ubuntu/9.04 (jaunty) Firefox/3.5'
#register :Firefox, '3.5', :'Windows 7',   :gecko, '20090612',   'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1) Gecko/20090612 Firefox/3.5'
register :Firefox, '3.1', :'Windows XP',  :gecko, '2009011606', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.6pre) Gecko/2009011606 Firefox/3.1'
register :Firefox, '3.0', :Linux,         :gecko, '2008062315', 'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9) Gecko/2008062315 (Gentoo) Firefox/3.0'
register :Firefox, '2.0', :Linux,         :gecko, '20061202',   'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.8.1) Gecko/20061202 Firefox/2.0'
register :Firefox, '3.6', :'OS X 10.6',   :gecko, '20100914',   'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10'




def get_request(name, version=nil)
  browser = USER_AGENTS[name.to_sym]
  if version
    browser = browser[version]
  else
    browser = browser.values.first
  end
  user_agent = browser[:user_agent] rescue nil
  raise "User Agent Not Found #{name} - #{version}" unless user_agent
  
  env = { "HTTP_USER_AGENT" => user_agent }

  Rack::Request.new( env ) 
   
end