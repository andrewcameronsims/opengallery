class PurchaseMailer < ApplicationMailer
  def test_email
    mail(to: 'testuserapp@gmail.com', subject: 'testing123')
  end
end
