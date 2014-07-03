RackMotion.use SizeStub

describe MotionOcean::Size, ".all" do

  it "should return an array of all sizes" do
    @sizes = []
    MotionOcean::Size.all do |sizes, error|
      @sizes = sizes
      resume
    end

    wait do
      @sizes.is_a?(Array).should.equal true
      @sizes.length.should.equal 9
    end
  end

  it "should assign all properties" do
    @size = @sizes.first

    @size.slug.should.equal          "512mb"
    @size.memory.should.equal        512
    @size.vcpus.should.equal         1
    @size.disk.should.equal          20
    @size.transfer.should.equal      1000
    @size.price_monthly.should.equal "5.0"
    @size.price_hourly.should.equal  "0.00744"
    @size.regions.should.equal       ["nyc1", "sgp1", "ams1", "ams2", "sfo1", "nyc2"]
  end

end
