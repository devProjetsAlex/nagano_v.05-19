class Reservation < ApplicationRecord
    belongs_to :user
    
    validates :arrival_date, presence: true
    validates :departure_date, presence: true
    validates :room_id, presence: true
 

end
