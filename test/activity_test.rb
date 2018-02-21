require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new('hiking')

    assert_equal 'hiking', activity.name
  end

  def test_it_has_participants
    participants = {
      'Adam': 300,
      'Kelly': 150
    }
    activity = Activity.new('hiking', participants)

    assert_equal 'hiking', activity.name
    assert_equal [:Adam, :Kelly], activity.people.keys
    assert_equal [300, 150], activity.people.values
    assert_equal 300, activity.people[:Adam]
  end

  def test_adding_participants_to_activity
    participants = {
      'Adam': 300,
      'Kelly': 150
    }
    activity = Activity.new('hiking', participants)
    activity.add_participant('Matt': 500)

    assert_equal [:Adam, :Kelly, :Matt], activity.people.keys
    assert_equal [300, 150, 500], activity.people.values
  end

  def test_summing_total_cost_of_activity
    participants = {
      'Adam': 300,
      'Kelly': 150
    }
    activity = Activity.new('hiking', participants)

    assert_equal 450, activity.sum_cost
  end

  def test_splitting_cost_of_activity
    participants = {
      'Adam': 300,
      'Kelly': 150,
      'Matt': 450
    }
    activity = Activity.new('hiking', participants)

    assert_equal 300, activity.split_cost
  end

  def test_telling_people_what_they_owe
    participants = {
      'Adam': 300,
      'Kelly': 150,
      'Matt': 450
    }
    activity = Activity.new('hiking', participants)

    assert_equal 'Adam paid the right amount. Kelly owes 150. Matt overpaid by 150.', activity.debt_analyzer
  end
end
