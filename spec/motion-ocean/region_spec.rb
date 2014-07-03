RackMotion.use RegionStub

describe MotionOcean::Region, ".all" do

  it "should return an array of all regions" do
    @regions = []
    MotionOcean::Region.all do |regions, error|
      @regions = regions
      resume
    end

    wait do
      @regions.is_a?(Array).should.equal true
      @regions.length.should.equal 6
    end
  end

  it "should assign all properties" do
    @region = @regions.first

    @region.slug.should.equal      "nyc1"
    @region.name.should.equal      "New York 1"
    @region.sizes.should.equal     ["512mb", "1gb", "2gb", "4gb", "8gb", "16gb", "32gb", "48gb", "64gb"]
    @region.available.should.equal true
    @region.features.should.equal  ["virtio", "backups"]
  end

end
