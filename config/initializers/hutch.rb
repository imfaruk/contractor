# frozen_string_literal: true

Hutch::Config.set(:force_publisher_confirms, true)
Hutch::Config.set(:mq_username, ENV.fetch('RABBITMQ_USERNAME', 'guest'))
Hutch::Config.set(:mq_password, ENV.fetch('RABBITMQ_PASSWORD', 'guest'))
Hutch::Config.set(:mq_host, ENV.fetch('RABBITMQ_HOST', 'localhost'))
Hutch.connect
