class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :skipper

  def start_time
    self.checkin
  end

  def end_time
    self.checkout
  end
end
