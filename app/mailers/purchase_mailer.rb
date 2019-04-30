class PurchaseMailer < ApplicationMailer
  def test_email
    mail(to: 'testuserapp6@gmail.com', subject: 'testing123')
  end
end
