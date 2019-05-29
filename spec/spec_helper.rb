$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "simplecov"

SimpleCov.start do
  add_filter "/spec/"
end

require "range_operations"

RSpec.configure do |config|
  config.expose_dsl_globally = false
end
