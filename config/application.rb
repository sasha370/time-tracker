require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)


module TimeTracker
  class Application < Rails::Application
    config.load_defaults 6.0
    # Подосединяем при автозагрузку папку lib? в которой у нас будет лежать логика для SMS
    config.autoload_paths << Rails.root.join("lib")
  end
end
