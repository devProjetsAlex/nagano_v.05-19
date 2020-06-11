class Room < ApplicationRecord
    validates :room_id, presence:true
    validates :room_description, presence:true
    validates :room_price, presence:true
end
