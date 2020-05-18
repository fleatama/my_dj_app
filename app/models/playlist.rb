class Playlist < ApplicationRecord
  has_many :movie_playlist_relationss, dependent: :destroy
  has_many :movies, through: :movie_playlist_relations
  # belongs_to :user, optional:true
  belongs_to :user
  # belongs_to :movie, optional:true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
end
