class Game < ApplicationRecord
  has_many :rents
  belongs_to :user
end
