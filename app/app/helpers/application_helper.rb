# frozen_string_literal: true

module ApplicationHelper
  def calculate_nights(check_in, check_out)
    (check_out - check_in).to_i
  end
end
