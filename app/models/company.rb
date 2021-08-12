class Company < ApplicationRecord
  has_many :recommendations
  has_many :users, :through => :recommendations

  has_many :watchlists
  has_many :users, :through => :watchlists
end
