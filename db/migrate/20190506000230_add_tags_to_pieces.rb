# frozen_string_literal: true

class AddTagsToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :tags, :string, array: true, default: []
  end
end
