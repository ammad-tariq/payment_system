# frozen_string_literal: true

class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[show edit update destroy]
  before_action :set_merchant_for_api, only: %i[api_request]
  def index
    @merchants = Merchant.all
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to merchant_url(@merchant), notice: 'Merchant was successfully updated.' }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @merchant.destroy

    respond_to do |format|
      format.html { redirect_to merchants_url, notice: 'Merchant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def api_request
    service = CreateTransactionFromApi.new(@merchant)
    message = service.send_request
    redirect_to merchant_url(@merchant), notice: message
  end

  private

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def set_merchant_for_api
    @merchant = Merchant.find(params[:merchant_id])
  end

  def merchant_params
    params.require(:merchant).permit(:name, :description, :email, :status, :role, :total_transaction_sum)
  end
end
