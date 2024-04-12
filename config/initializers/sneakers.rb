# frozen_string_literal: true

require 'sneakers'
require 'sneakers/metrics/logging_metrics'
require 'sneakers/handlers/maxretry'

WORKER_OPTIONS = {
  retry_timeout: 60 * 1000,
  ack: true,
  threads: 10,
  prefetch: 10
}.freeze

Sneakers.configure  amqp: ENV.fetch('RABBIT_URL'),
                    daemonize: false,
                    exchange_type: :direct,
                    handler: Sneakers::Handlers::Maxretry,
                    heartbeat: ENV.fetch('RABBIT_HEARTBEAT').to_i,
                    start_worker_delay: ENV.fetch('RABBIT_START_WORKER_DELAY').to_f,
                    metrics: Sneakers::Metrics::LoggingMetrics.new,
                    vhost: ENV.fetch('RABBIT_VHOST'),
                    workers: ENV.fetch('RABBIT_WORKERS').to_i
