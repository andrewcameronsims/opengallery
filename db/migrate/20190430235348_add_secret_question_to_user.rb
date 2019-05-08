# frozen_string_literal: true

class AddSecretQuestionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :secret_question, :string
  end
end
