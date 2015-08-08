class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.text :thumburl
      t.text :linkedinurl
      t.string :major
      t.string :email
      t.string :graduation_date
      t.boolean :is_executive
      t.string :executive_position
      t.timestamps
    end
  end
end
