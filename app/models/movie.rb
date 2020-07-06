class Movie < ApplicationRecord
  # 1ページに表示する件数の設定(Kaminari)
  paginates_per 10
  # belongs_to :user, optional:true
  # belongs_to :user
  has_many :movie_playlist_relations, dependent: :destroy
  has_many :playlists, through: :movie_playlist_relations
  # has_many :playlists, through: :movie_playlist_relations,
  #           foreign_key: "playlist_id",
  #           dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  # validates :user_id, presence: true
  # validates :title, presence: true
  accepts_nested_attributes_for :playlists

  # def playlisted_by?(user)
  #   playlists.where(user_id: user.id).exists?
  # end

  # def save_playlists(tags)
  #   current_tags = self.playlists.pluck(:name) unless self.playlists.nil?
  #   old_tags = current_tagas - tags
  #   new_tags = tags - current_tags

  #   Destroy old taggings:
  #   old_tags.each do |old_name|
  #     self.playlists.delete Playlist.find_by(name:old_name)
  #   end

  #   Create ne taggings:
  #   new_tags.each do |new_name|
  #     movie_playlist_relation = Playlist.find_or_create_by(name:new_name)
  #     self.playlists << movie_playlist_relation
  #   end
  # end
end
