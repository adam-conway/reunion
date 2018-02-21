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
end
