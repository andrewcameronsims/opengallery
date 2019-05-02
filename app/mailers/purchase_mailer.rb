class PurchaseMailer < ApplicationMailer
  def purchase_email
    @user_name = params[:user]
    mail(to: 'testuserapp6@gmail.com', subject: 'Your Purchase Invoice')
  end
end

