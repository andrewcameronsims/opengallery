class ChargesController < ApplicationController
  def new
  end

  def create
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

    # Flag piece as sold and link to buyer.
    piece = Piece.find(cookies[:piece_id])
    piece.sold = true
    piece.user_id = current_user.id
    piece.save

    # Notify artist of the sale.
    artist = 

    # Customer was charged. Send an invoice.
    PurchaseMailer.with(user: current_user.full_name).purchase_email.deliver_now
    
  end
end
