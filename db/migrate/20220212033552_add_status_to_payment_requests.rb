# frozen_string_literal: true

class AddStatusToPaymentRequests < ActiveRecord::Migration[6.1]
  def up
    execute("CREATE TYPE payment_request_status AS ENUM ('pending', 'approved', 'rejected');")
    add_column(:payment_requests, :status, :payment_request_status, default: 'pending')
  end

  def down
    remove_column(:payment_requests, :status)
    execute('DROP TYPE payment_request_status;')
  end
end
