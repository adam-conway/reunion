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

  def reunion_debt_analyzer
    people = @activities.map {|activity| activity.people.keys}.flatten.uniq
    breakdown = @activities.map do |activity|
      activity.debt_analyzer
    end

    breakdown2 = breakdown.map do |activity|
      activity.split('.')
    end.flatten

    breakdown3 = breakdown2.map do |persons_debts|
      if persons_debts.include?('right')
        0
      elsif persons_debts.include?('owes')
        -persons_debts.split[-1].to_i
      elsif persons_debts.include?('overpaid')
        persons_debts.split[-1].to_i
      end
    end

    binding.pry

  end
end
