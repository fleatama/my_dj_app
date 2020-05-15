class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :playlists, class_name: "Playlist",
  #           foreign_key: "playlist_id",
  #           dependent: :destroy
  has_many :playlists
  has_many :movies, dependent: :destroy
  # has_many :movie_playlist_relations, class_name: "Playlist",
  #           foreign_key: "playlist_id",
  #           dependent: :destroy
  has_many :movie_playlist_relations
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
end