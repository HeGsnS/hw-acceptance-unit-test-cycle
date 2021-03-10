require 'rspec/core'

RSpec.configure do |configs|
  configs.mock_with :rspec do |config|
    config.syntax = [:should, :expect]
  end
  configs.expect_with :rspec do |config|
    config.syntax = [:should, :expect]
  end
end