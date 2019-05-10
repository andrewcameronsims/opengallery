# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@open-gallery.herokuapps.com'
  layout 'mailer'
end
