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
end
