require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'rails/test_unit/railtie'
require 'mongoid/railtie'


# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module StrokeUnitNet
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
    
    config.generators do |g|
      g.orm                 :mongoid
      g.template_engine     :haml
      g.test_framework      :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    
  end
end