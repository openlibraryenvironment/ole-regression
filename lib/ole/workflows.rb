# Helper methods that don't properly belong elsewhere. This is
# a sort of "catch all" Module.
#!/usr/bin/env ruby
#encoding : utf-8
#require 'abc'


module Workflows




  def initialize(browser , opts={})
    @browser = browser

    defaults = {
        loan_item_barcode: 0
    }
    set_options(defaults.merge(opts))
  end

  def log_in(username)

    visit OLELoginPage do |page|
      # page.cookies.clear
      # sleep(20)
      page.ole_login.set username
    end
  end

  def uniq_alphanums
    @currenttime = DateTime.now
    @day = @currenttime.strftime("%d")
    @month = @currenttime.strftime("%b")
    @hour = @currenttime.strftime("%H")
    @min = @currenttime.strftime("%M")
    @sec = @currenttime.strftime("%S")
    @year = @currenttime.strftime("%Y")
    @day+@month+@year+@hour+@min+@sec
  end

  def uniq_number
    @currenttime = DateTime.now
    @day = @currenttime.strftime("%d")
    @month = @currenttime.strftime("%m")
    @hour = @currenttime.strftime("%H")
    @min = @currenttime.strftime("%M")
    @sec = @currenttime.strftime("%S")
    @year = @currenttime.strftime("%Y")
    @day+@month+@year+@hour+@min+@sec
  end



end