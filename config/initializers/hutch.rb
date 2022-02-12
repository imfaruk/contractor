# frozen_string_literal: true

Hutch::Config.set(:force_publisher_confirms, true)
Hutch::Config.set(:mq_username, 'guest')
Hutch::Config.set(:mq_password, 'guest')
Hutch::Config.set(:mq_host, 'localhost')
Hutch.connect
