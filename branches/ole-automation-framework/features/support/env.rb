$test_site = "qa.ole.kuali.org"

$target_folder = File.expand_path("../lib/resources", "#{File}" )
$: << File.dirname(__FILE__)+'/../../lib'

require 'ole'

World Foundry
World StringFactory
World DateFactory
World Workflows

client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 60 # seconds default is 60

browser = nil
headless = nil
$browserPath = ENV['browser_path'] unless ENV['browser_path'].nil?


if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new :destroy_at_exit => false
  headless.start

  #to avoid nil browser error, retry initial browser connect in headless env
  retry_ctr = 0
  while browser.nil? and retry_ctr < 2
    retry_ctr += 1
    puts "debug env.rb - browser init - attempt #{retry_ctr}"
    begin
      browser = Watir::Browser.new :firefox, :http_client => client
      browser.goto("#{$test_site}")
      sleep 2
      # raise "connect failed" unless  browser.text_field(id: "j_username").exists?
      browser.close
      puts "debug env.rb - success: browser connection attempt #{retry_ctr}"
    rescue
      puts "debug env.rb - connect failed"
      browser.close unless browser.nil?
      browser = nil
      sleep 5
    end
  end
  browser = nil
end


#re-use browser for each scenario
Before do
  if browser == nil
    puts "debug  env.rb - creating new browser"
    if $browserPath != nil
      puts 'Trying to open custom browser path'
      Selenium::WebDriver::Firefox.path = $browserPath
    end
    browser = Watir::Browser.new :firefox, :http_client => client
    puts "debug  env.rb - browser.nil? #{browser.nil?}"
  end
  @browser = browser
end

at_exit { browser.close unless browser == nil }
