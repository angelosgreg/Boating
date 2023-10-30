class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat

  def start_time
    self.checkin
  end

  def end_time
    self.checkout
  end
end
