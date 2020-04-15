class RemoveYoutubeUrlFromPlaylists < ActiveRecord::Migration[5.2]
  def change
    remove_column :playlists, :youtube_url, :string
  end
end
