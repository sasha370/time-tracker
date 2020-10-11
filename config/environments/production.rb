Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = {:host => 'https://time-tracker-hq.herokuapp.com/', :protocol => 'https'}
  config.action_mailer.raise_delivery_errors = true
  # для остеживания всех ошибок
  Rails.application.config.middleware.use ExceptionNotification::Rack,
                                          email: {
                                              deliver_with: :deliver, # Rails >= 4.2.1 do not need this option since it defaults to :deliver_now
                                              email_prefix: '[PREFIX] ',
                                              sender_address: %{"Time Tracker error" <support@university.com>},
                                              exception_recipients: %w{budka52@bk.ru}
                                          }

end
