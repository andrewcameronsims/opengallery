class PurchaseMailer < ApplicationMailer
  def purchase_email
    @user = params[:user]
    mail(to: 'testuserapp6@gmail.com', subject: 'Your Purchase Invoice')
  end
end

