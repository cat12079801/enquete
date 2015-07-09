class Author < ActiveRecord::Base
  has_many :game_author
  has_many :game, :through => :game_author
end
