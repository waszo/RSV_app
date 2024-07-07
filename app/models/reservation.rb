class Reservation < ApplicationRecord
    belongs_to:user
    belongs_to :room
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validates :number_of_people, numericality: { greater_than_or_equal_to: 1 }

    validate :start_future
    validate :finish_ago

    def start_future
      if start_date.nil? ||start_date < Date.today
        errors.add(:start_date, "は今日以降の日付を選択してください")
      end
    end

    def finish_ago
      if finish_date.nil? || finish_date < start_date
        errors.add(:finish_date,"はチェックイン以降を選択してください")  
      end
    end  
end