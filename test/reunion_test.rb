require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new

    assert_instance_of Reunion, reunion
  end

  def test_it_has_location
    reunion = Reunion.new('beach')

    assert_equal 'beach', reunion.location
  end

  def test_it_has_activities
    participants = {
      'Adam': 300,
      'Kelly': 150,
      'Matt': 450
    }
    activity = Activity.new('hiking', participants)
    reunion = Reunion.new('beach', activity)

    assert_equal 'hiking', reunion.activities.first.name
    assert_equal [:Adam, :Kelly, :Matt], reunion.activities.first.people.keys
  end

  def test_adding_activity
    participants = {
      'Adam': 300,
    }
    activity = Activity.new('hiking', participants)
    reunion = Reunion.new('beach', activity)

    participants2 = {
      'Kelly': 150,
      'Matt': 450
    }
    activity2 = Activity.new('surfing', participants2)
    reunion.add_activity(activity2)

    assert_equal 2, reunion.activities.length
    assert_equal 'surfing', reunion.activities.last.name
  end
end
