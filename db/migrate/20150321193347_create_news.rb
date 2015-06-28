class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :date
      t.string :thumburl
      t.string :description
      t.timestamps
    end
  end
end
