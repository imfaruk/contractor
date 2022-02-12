# frozen_string_literal: true

class PaymentRequestStatus
  include Hutch::Consumer
  consume 'payment_request_status_update'

  def process(message)
    payment_request_id = message.body[:id]
    payment_request_status = message.body[:status]
    payment_request = PaymentRequest.find(payment_request_id)
    payment_request.update!(status: payment_request_status)
  end
end
