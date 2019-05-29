$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "range_operations"

RSpec.configure do |config|
  config.expose_dsl_globally = false
end
