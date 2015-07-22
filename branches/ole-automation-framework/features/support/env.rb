$test_site = "qa.ole.kuali.org"

#$target_folder = File.expand_path("../lib/resources", "#{File}" )
$: << File.dirname(__FILE__)+'/../../lib'

require 'ole'

World Foundry
World StringFactory
World DateFactory
World Workflows

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 60 # seconds default is 60

browser = nil

#re-use browser for each scenario
Before do
  if browser == nil
    puts "debug  env.rb - creating new browser"
    browser = Watir::Browser.new :firefox, :http_client => client
    puts "debug  env.rb - browser.nil? #{browser.nil?}"
  end
  @browser = browser
end

