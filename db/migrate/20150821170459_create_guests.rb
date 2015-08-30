class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :company
      t.string :subject
      t.string :message
      t.string :major
      t.string :grad_season
      t.string :grad_year
      t.string :type

      t.timestamps
    end
  end
end
