# Creating a separate file is a good practice here since it isolates and separate concerns with different test configs
require 'factory_bot'

RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
end