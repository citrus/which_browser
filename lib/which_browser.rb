module WhichBrowser

  def test_user_agent(regex)
    self.env["HTTP_USER_AGENT"] && self.env["HTTP_USER_AGENT"].match(regex) != nil
  end


  # =============================================
  # OS Methods
  
  def mac?
     test_user_agent(/Macintosh/)
  end
  
  def pc?
     test_user_agent(/Windows/)
  end
  
  def linux?
     test_user_agent(/Linux/)
  end
  
  
  # =============================================
  # iOS Methods
    
  def mobile_safari?
    test_user_agent(/Mobile\/.+Safari/)
  end
  
  def iphone?
    mobile_safari? && test_user_agent(/iPhone/)
  end
  
  def ipod?
    mobile_safari? && test_user_agent(/iPod/)
  end
  
  def ipad?
    mobile_safari? && test_user_agent(/iPad/)
  end
  
  
  # =============================================
  # Browsers
  
  def safari?
    test_user_agent(/Safari/) && !mobile_safari?
  end
  
  def firefox?
    test_user_agent(/Firefox/)
  end
  
  def chrome?
    test_user_agent(/Chrome/)
  end
  
  def opera?
    test_user_agent(/Opera/)
  end
  
  
  # =============================================
  # IE Methods
  
  def ie?
    test_user_agent(/MSIE\s[56789]/)
  end
  
  def old_ie?
    test_user_agent(/MSIE\s[56]/)
  end
  
  [5,6,7,8].each do |num|
    define_method "ie#{num}?" do
      test_user_agent Regexp.new("MSIE\s#{num}")
    end
  end
  

end

Rack::Request.send(:include, WhichBrowser)