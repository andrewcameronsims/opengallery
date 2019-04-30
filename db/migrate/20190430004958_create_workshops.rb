class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :bio
      t.string :bank_account
      t.string :auto_respond_msg
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
