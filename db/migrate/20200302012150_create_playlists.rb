class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add index :playlists, [:user_id, :created_at]
  end
end
