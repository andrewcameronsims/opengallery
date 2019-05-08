# frozen_string_literal: true

class AddEncryptedSecretToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_secret, :string
  end
end
