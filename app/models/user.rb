class User < ApplicationRecord


  has_many :tags, as: :taggable

end
