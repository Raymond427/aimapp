class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :thumb_url
      t.string :linkedin_url
      t.string :major
      t.string :email
      t.string :graduation_date
      t.boolean :is_executive
      t.string :executive_position
      t.Hash :executive_career
      t.timestamps
    end
  end
end
