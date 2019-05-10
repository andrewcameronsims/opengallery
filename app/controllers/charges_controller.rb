# frozen_string_literal: true

class ChargesController < ApplicationController
  def create
    # Amount in cents
    piece = Piece.find(cookies.encrypted[:piece_id])
    @amount = (piece.price.to_f * 100).to_i

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

    # Flag piece as sold and link to buyer.
    piece.sold = true
    piece.user_id = current_user.id
    piece.save



    # Define params for mailer
    artist = piece.workshop.user

    @sale_data = {
      artist: artist.full_name,
      artist_email: artist.email,
      buyer: current_user.full_name,
      buyer_email: current_user.email,
      piece_name: piece.name,
      price: @amount,
      invoice: Faker::Invoice.reference,
      auto_msg: piece.workshop.auto_respond_msg
    }
  
    # Customer was charged. Send an invoice.
    PurchaseMailer.with(sale_data: @sale_data).purchase_email.deliver_now

    # Artist sold a piece. Send a notification.
    PurchaseMailer.with(sale_data: @sale_data).seller_email.deliver_now
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
