class CreateJoinMailers < ActiveRecord::Migration
  def change
    create_table :join_mailers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :major
      t.string :grad_date
      t.string :message

      t.timestamps null: false
    end
  end
end
