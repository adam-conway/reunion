class Activity
  attr_reader :name,
              :people

  def initialize(name = 'generic activity', people = 'nobody')
    @name = name
    @people = people
  end

  def add_participant(hash)
    @people[hash.keys.first] = hash.values.first
  end

  def sum_cost
    @people.values.sum
  end

  def split_cost
    sum_cost / @people.values.length
  end

  def debt_analyzer
    final_output = ''
    @people.keys.each do |person|
      if @people[person] > split_cost
        final_output += "#{person} overpaid by #{@people[person] - split_cost}. "
      elsif @people[person] < split_cost
        final_output += "#{person} owes #{split_cost - @people[person]}. "
      else
        final_output += "#{person} paid the right amount. "
      end
    end
    final_output.rstrip
  end
end
