module WhichBrowser

  # =============================================
  # OS Methods
  
  def mac?
     browser_test(/Macintosh/)
  end
  
  def pc?
     browser_test(/Windows/)
  end
  
  def linux?
     browser_test(/Linux/)
  end
  
  
  # =============================================
  # iOS Methods
    
  def mobile_safari?
    browser_test(/(Mobile\/.+Safari)/)
  end
  
  def iphone?
    mobile_safari? && browser_test(/iPhone/)
  end
  
  def ipod?
    mobile_safari? && browser_test(/iPod/)
  end
  
  def ipad?
    mobile_safari? && browser_test(/iPad/)
  end
  
  
  # =============================================
  # Browsers
  
  def safari?
    browser_test(/Safari/)
  end
  
  def firefox?
    browser_test(/Firefox/)
  end
  
  def chrome?
    browser_test(/Chrome/)
  end
  
  def opera?
    browser_test(/Opera/)
  end
  
  
  # =============================================
  # IE Methods
  
  def ie?
    browser_test(/MSIE\s[5678]/)
  end
  
  [5,6,7,8].each do |num|
    define_method "ie#{num}?" do
      browser_test Regexp.new("MSIE\s#{num}")
    end
  end
  
  def browser_test(regex)
    self.env["HTTP_USER_AGENT"] && self.env["HTTP_USER_AGENT"][regex]
  end

end

Rack::Request.send(:include, WhichBrowser)