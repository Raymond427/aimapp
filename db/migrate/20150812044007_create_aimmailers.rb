class CreateAimMailers < ActiveRecord::Migration
  def change
    create_table :aim_mailers do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :subject
      t.string :message
      t.string :company
      t.string :phone_number
      t.timestamps
    end
  end
end
