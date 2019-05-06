class AddTagsToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :tags, :string, default: []
  end
end
