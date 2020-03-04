class AddYoutubeUrlToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :youtube_url, :string
  end
end
