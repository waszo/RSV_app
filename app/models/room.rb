class Room < ApplicationRecord
    belongs_to:user
    has_many:reservations
    mount_uploader :image_room, ImageRoomUploader

    validates :price, numericality: { greater_than_or_equal_to: 1 }
    
end