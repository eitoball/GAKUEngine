ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'active_record/fixtures'
require 'factory_girl_rails'


Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
#Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each { |f| require File.expand_path(f)}


# reload all the models
Dir["#{Rails.root}/app/models/**/*.rb"].each do |model|
  load model 
end

# reload all factories
FactoryGirl.factories.clear
Dir.glob("#{::Rails.root}/spec/factories/*.rb").each do |file|
  load "#{file}"
end


GAKUEngine::Application.reload_routes!

RSpec.configure do |config|

  config.mock_with :rspec

  config.before(:each) do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  #config.include RSpecSupport::ControllerHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :controller
end

RSpec::Matchers.define :have_valid_factory do |factory_name|
  match do |model|
    Factory(factory_name).new_record?.should be_false
  end
end