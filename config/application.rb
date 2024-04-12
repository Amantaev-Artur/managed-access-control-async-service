require_relative "boot"

require "rails/all"
require 'dotenv/load'

Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))
    config.active_job.queue_adapter = :sneakers
    config.autoload_paths += %W[#{config.root}/app/consumers/ #{config.root}/app/services/ #{config.root}/lib/]

  end
end
