RackMotion.use DropletStub

describe MotionOcean::Droplet, ".all" do

  it "should return an array of all droplets" do
    @droplets = []
    MotionOcean::Droplet.all do |droplets, error|
      @droplets = droplets
      resume
    end

    wait do
      @droplets.is_a?(Array).should.equal true
      @droplets.length.should.equal 1
    end
  end

  it "should assign all properties" do
    @droplet = @droplets.first

    @droplet.id.should.equal     12345
    @droplet.name.should.equal   "motion-ocean"
    @droplet.locked.should.equal false
    @droplet.status.should.equal "active"
    @droplet.backup_ids.should.equal   [1, 2, 3]
    @droplet.snapshot_ids.should.equal [4, 5, 6]
    @droplet.action_ids.should.equal   [7, 8, 9]
  end

  it "should have the assigned region" do
    @droplet.region.is_a?(MotionOcean::Region).should.equal true
  end

  it "should have the image it was created from" do
    @droplet.image.is_a?(MotionOcean::Image).should.equal true
  end

  it "should have the size of allocated resources" do
    @droplet.size.is_a?(MotionOcean::Size).should.equal true
  end

end

describe MotionOcean::Droplet, ".find" do

  it "should return a single droplet with the given ID" do
    MotionOcean::Droplet.find(12345) do |droplet, error|
      @droplet = droplet
      resume
    end

    wait do
      @droplet.is_a?(MotionOcean::Droplet).should.equal true
    end
  end

  it "should assign all properties" do
    @droplet.id.should.equal     12345
    @droplet.name.should.equal   "motion-ocean"
    @droplet.locked.should.equal false
    @droplet.status.should.equal "active"
    @droplet.backup_ids.should.equal   [1, 2, 3]
    @droplet.snapshot_ids.should.equal [4, 5, 6]
    @droplet.action_ids.should.equal   [7, 8, 9]
  end

  it "should have the assigned region" do
    @droplet.region.is_a?(MotionOcean::Region).should.equal true
  end

  it "should have the image it was created from" do
    @droplet.image.is_a?(MotionOcean::Image).should.equal true
  end

  it "should have the size of allocated resources" do
    @droplet.size.is_a?(MotionOcean::Size).should.equal true
  end

end
