class AddPlaylistNameToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :playlist_name, :text
  end
end
