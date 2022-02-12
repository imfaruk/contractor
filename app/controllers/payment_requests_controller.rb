# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  before_action :set_payment_request, only: %i[show edit update destroy]

  def index
    @payment_requests = PaymentRequest.all
  end

  def show; end

  def new
    @payment_request = PaymentRequest.new
  end

  def edit; end

  def create
    @payment_request = PaymentRequest.new(payment_request_params)

    respond_to do |format|
      if @payment_request.save
        format.html do
          redirect_to payment_request_url(@payment_request), notice: 'Payment request was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment_request.pending? && @payment_request.update(payment_request_params)
        format.html do
          redirect_to payment_request_url(@payment_request), notice: 'Payment request was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment_request.destroy

    respond_to do |format|
      format.html { redirect_to payment_requests_url, notice: 'Payment request was successfully destroyed.' }
    end
  end

  private

  def set_payment_request
    @payment_request = PaymentRequest.find(params[:id])
  end

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description)
  end
end
