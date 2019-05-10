# frozen_string_literal: true

class PurchaseMailer < ApplicationMailer
  def purchase_email
    @sale_data = params[:sale_data]
    mail(to: @sale_data[:buyer_email], subject: "Here's your purchase invoice!")
  end

  def seller_email
    @sale_data = params[:sale_data]
    mail(to: @sale_data[:artist_email], subject: "You've sold an artwork!")
  end
end
