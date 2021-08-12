class User < ApplicationRecord
  has_many :recommendations
  has_many :companies, :through => :recommendations

  has_many :watchlists
  has_many :companies, :through => :watchlists
end
