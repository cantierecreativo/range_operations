$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "range_operations"

RSpec.configure do |config| 
  config.expose_dsl_globally = false
end
