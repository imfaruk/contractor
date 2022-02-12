# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  CURRENCIES = %w[USD EUR GBP CAD].freeze
  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }
  validates :amount, :currency, :description, :status, presence: true

  validates :status, inclusion: { in: statuses.keys }
end
