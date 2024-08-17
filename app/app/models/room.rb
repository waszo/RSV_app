# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  has_one_attached :image

  def self.ransackable_attributes(_auth_object = nil)
    %w[address created_at details id image introduction name price updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob reservations user]
  end

  with_options presence: true do
    validates :name
    validates :details
    validates :price
    validates :address
  end

  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
