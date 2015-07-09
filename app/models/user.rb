class User < ActiveRecord::Base
  has_many :session
end
