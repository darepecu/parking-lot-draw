
class HomeController < ApplicationController
  def index
    @raffle_count = Raffle.count
    @end_raffle = Raffle.where(assigned: true).count.eql?(Parking.count)
  end
end