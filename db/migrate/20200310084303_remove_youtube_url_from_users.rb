class RemoveYoutubeUrlFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :youtube_url, :string
  end
end
