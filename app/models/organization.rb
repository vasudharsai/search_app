class Organization < ApplicationRecord

  has_many :domain_names
  has_many :tags, as: :taggable


end
