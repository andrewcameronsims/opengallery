# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    # Flag piece as sold and link to buyer.
    piece = Piece.find(cookies.encrypted[:piece_id])
    piece.sold = true
    piece.user_id = current_user.id
    piece.save

    # Notify artist of the sale.
    artist = piece.workshop.user

    # Define params for mailer
    sale_data = {
      artist: artist.full_name,
      artist_email: artist.email,
      buyer: current_user.full_name,
      buyer_email: current_user.email
    }

    # Amount in cents
    @amount = piece.price

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )
  
    # Customer was charged. Send an invoice.
    PurchaseMailer.with(sale_data: sale_data).purchase_email.deliver_now

    # Artist sold a piece. Send a notification.
    PurchaseMailer.with(sale_data: sale_data).seller_email.deliver_now
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
