module WhichBrowser

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
  alias :ff? :firefox? 
  
  def chrome?
    test_user_agent(/Chrome/)
  end
  
  def opera?
    test_user_agent(/Opera/)
  end
  
  def ie?
    test_user_agent(/MSIE\s[56789]/)
  end
  
  def old_ie?
    test_user_agent(/MSIE\s[456]/)
  end
  
  
  # =============================================
  # Versions
  
  
  def test_user_agent(regex)
    self.user_agent && self.user_agent.match(regex) != nil
  end
  
    
  private
    
    def method_missing(method, *args, &block)
      if matches = method.to_s.match(/^(ie|safari|ios|ff|firefox|chrome|opera)\_version$/)

        get_browser_version(matches[1])

      elsif matches = method.to_s.match(/^(ie|safari|ff|firefox|chrome|opera)(_[l|g]te?)?([0-9]+)\?$/)

        browser_v = self.send(matches[1] + "_version")
        
        # method really is missing
        super if browser_v == nil
        
        # browser version not found
        return false unless browser_v        
        
        operator = matches[2].to_s.sub('_', '')
        version  = matches[3].to_f
        
        case operator
          when 'lt'
            browser_v < version
          when 'gt'
            browser_v > version            
          when 'lte'
            browser_v <= version
          when 'gte'
            browser_v >= version
          else
            test_user_agent Regexp.new("MSIE\s#{version.to_i}")
        end
      
      else
        super
      end 
    end
    
    
    def get_browser_version(name)
      case name
        when 'ie'
          extract_version_with(/MSIE\s?([0-9\.]+)/)
        when 'safari'
          extract_version_with(/Version\/([0-9\.]+)\sSafari/)
        when 'ios'
          extract_version_with(/Version\/([0-9\.]+)\sMobile/)
        when 'ff', 'firefox'
          extract_version_with(/Firefox\/([0-9\.]+)/)
        when 'chrome'
          extract_version_with(/Chrome\/([0-9\.]+)/)
        when 'opera'       
          return false unless opera?
          extract_version_with(/Version\/([0-9\.]+)$/)
      end
    end
    
    def extract_version_with(regex)
      v = (self.user_agent.match(regex) || [])[1].to_f
      0 < v ? v : false      
    end
    
end

Rack::Request.send(:include, WhichBrowser)