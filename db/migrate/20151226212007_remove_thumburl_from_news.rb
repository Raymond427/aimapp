class RemoveThumburlFromNews < ActiveRecord::Migration
  def change
    remove_column :news, :thumburl, :string
  end
end
