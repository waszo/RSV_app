class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    #has_one_attached :image_name
    has_many:rooms
    has_many:reservations
  
    mount_uploader :image_name, ImageNameUploader
  end