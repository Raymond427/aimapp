class RemoveThumburlFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :thumburl, :string
  end
end
