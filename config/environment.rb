# Load the rails application
require File.expand_path('../application', __FILE__)

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular "reserve", "reserves"
end

# Initialize the rails application
Aitel::Application.initialize!
Dir.glob(File.join("lib", "extend", "*")).each {|x| require ("./" + x) }
