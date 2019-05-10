# frozen_string_literal: true

class PurchaseMailer < ApplicationMailer
  def purchase_email
    @sale_data = params[:sale_data]
    mail(to: "testuserapp6@gmail.com", subject: "Here's your purchase invoice!")
  end

  def seller_email
    @sale_data = params[:sale_data]
    mail(to: "testuserapp6@gmail.com", subject: "You've sold an artwork!")
  end
end
