class Playlist < ApplicationRecord
  belongs_to :user, optional:true
  belongs_to :movie, optional:true
  has_many :movie_playlist_relationss
  has_many :movies, through: :movie_playlist_relations
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
end
