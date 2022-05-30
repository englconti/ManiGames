class Rent < ApplicationRecord
  belongs_to :user_id
  belongs_to :game_id
end
