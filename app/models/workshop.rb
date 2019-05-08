# frozen_string_literal: true

class Workshop < ApplicationRecord
  validates :bio, presence: true
  validates :bank_account, length: {is: 10}, numericality: { greater_than_or_equal_to: 10 }, presence: true
  belongs_to :user
end
