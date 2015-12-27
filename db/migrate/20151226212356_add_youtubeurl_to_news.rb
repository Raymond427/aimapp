class AddYoutubeurlToNews < ActiveRecord::Migration
  def change
    add_column :news, :youtubeurl, :string
  end
end
