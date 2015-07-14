class Game < ActiveRecord::Base
  has_many :game_author
  has_many :author, :through => :game_author
  has_many :collect

  mount_uploader :image, PictureUploader
end
