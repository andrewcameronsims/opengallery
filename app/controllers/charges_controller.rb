class ChargesController < ApplicationController
  def new
    
  end
  
  def create
    
    # Piece was sold. Change status and link to buyer.
    @piece = Piece.find(params[:id])
    @piece.sold = true
    @piece.user_id = current_user.id
    @piece.save

    # Define the artist
    @artist = @piece.workshop.user
    
    # Amount in cents
    @amount = 500
    
    customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })
  
    charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd',
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  
  
  # Customer was charged. Send an invoice.
  PurchaseMailer.with(user: current_user.full_name).purchase_email.deliver_now
  
  # Artist sold a piece. Send a notification.
  PurchaseMailer.with(user: @artist.full_name).seller_email.deliver_now
  
end
end
