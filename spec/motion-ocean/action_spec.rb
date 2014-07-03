RackMotion.use ActionStub

describe MotionOcean::Action, ".all" do

  it "should return an array of all actions" do
    @actions = []
    MotionOcean::Action.all do |actions, error|
      @actions = actions
      resume
    end

    wait do
      @actions.is_a?(Array).should.equal true
      @actions.length.should.equal 3
    end
  end

  it "should assign all properties" do
    @action = @actions.first

    @action.id.should.equal            12345
    @action.status.should.equal        "completed"
    @action.type.should.equal          "power_off"
    @action.resource_id.should.equal   12345
    @action.resource_type.should.equal "droplet"
    @action.region.should.equal        "nyc2"

    dateFormatter = NSDateFormatter.new
    dateFormatter.setDateFormat(MotionOcean::DATETIME_FORMAT)
    @action.started_at.should.equal   dateFormatter.dateFromString("2014-06-29T16:20:06Z")
    @action.completed_at.should.equal dateFormatter.dateFromString("2014-06-29T16:20:12Z")
  end

end

describe MotionOcean::Action, ".find" do

  it "should return a single action with the given ID" do
    MotionOcean::Action.find(12345) do |action, error|
      @action = action
      resume
    end

    wait do
      @action.is_a?(MotionOcean::Action).should.equal true
    end
  end

  it "should assign all properties" do
    @action.id.should.equal            12345
    @action.status.should.equal        "completed"
    @action.type.should.equal          "power_off"
    @action.resource_id.should.equal   12345
    @action.resource_type.should.equal "droplet"
    @action.region.should.equal        "nyc2"

    dateFormatter = NSDateFormatter.new
    dateFormatter.setDateFormat(MotionOcean::DATETIME_FORMAT)
    @action.started_at.should.equal   dateFormatter.dateFromString("2014-06-29T16:20:06Z")
    @action.completed_at.should.equal dateFormatter.dateFromString("2014-06-29T16:20:12Z")
  end

end
