require 'test-factory'

$: << File.dirname(__FILE__)+'/ole'
#require 'ole/base_page'
Dir["#{File.dirname(__FILE__)}/ole/*.rb"].each {|f| require f }
#Dir["#{File.dirname(__FILE__)}/ole/pages/*.rb"].each {|f| require f }
Dir["#{File.dirname(__FILE__)}/ole/pages/**/*.rb"].each {|f| require f }
Dir["#{File.dirname(__FILE__)}/ole/data_objects/*.rb"].each {|f| require f }

