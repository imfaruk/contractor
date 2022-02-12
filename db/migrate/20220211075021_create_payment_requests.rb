# frozen_string_literal: true

class CreatePaymentRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_requests do |t|
      t.text :description
      t.decimal :amount, precision: 8, scale: 2, null: false
      t.string :currency, null: false
      t.timestamps
    end
  end
end
