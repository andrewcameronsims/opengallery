# frozen_string_literal: true

class Follower < ApplicationRecord
  validates :user_id, presence: true
  validates :workshop_id, presence: true

  belongs_to :user
  belongs_to :workshop
end
