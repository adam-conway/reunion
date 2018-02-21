require 'pry'

class Reunion
  attr_reader :location,
              :activities
  def initialize(location = 'nowhere', activity = 'nothing')
    @location = location
    @activities = []
    @activities << activity
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    cost = 0
    @activities.each do |activity|
      cost += activity.sum_cost
    end
    cost
  end

  def debt_analyzer
    # names = @activities.map {|activity| activity.people.keys}.flatten.uniq
    binding.pry

  end
end
