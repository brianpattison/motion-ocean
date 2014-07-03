RackMotion.use ImageStub

describe MotionOcean::Image, ".all" do

  it "should return an array of all images" do
    @images = []
    MotionOcean::Image.all do |images, error|
      @images = images
      resume
    end

    wait do
      @images.is_a?(Array).should.equal true
      @images.length.should.equal 36
    end
  end

  it "should assign all properties" do
    @image = @images.first

    @image.id.should.equal           1601
    @image.name.should.equal         "CentOS 5.8 x64"
    @image.distribution.should.equal "CentOS"
    @image.slug.should.equal         "centos-5-8-x64"
    @image.public.should.equal       true
    @image.regions.should.equal      ["nyc1", "ams1", "sfo1", "nyc2", "ams2", "sgp1", "lon1", "nyc1"]

    dateFormatter = NSDateFormatter.new
    dateFormatter.setDateFormat(MotionOcean::DATETIME_FORMAT)
    @image.created_at.should.equal dateFormatter.dateFromString("2012-04-09T11:17:11Z")
  end

end

describe MotionOcean::Image, ".find" do

  it "should return a single image with the given ID" do
    MotionOcean::Image.find(1601) do |image, error|
      @image = image
      resume
    end

    wait do
      @image.is_a?(MotionOcean::Image).should.equal true
    end
  end

  it "should assign all properties" do
    @image.id.should.equal           1601
    @image.name.should.equal         "CentOS 5.8 x64"
    @image.distribution.should.equal "CentOS"
    @image.slug.should.equal         "centos-5-8-x64"
    @image.public.should.equal       true
    @image.regions.should.equal      ["nyc1", "ams1", "sfo1", "nyc2", "ams2", "sgp1", "lon1", "nyc1"]

    dateFormatter = NSDateFormatter.new
    dateFormatter.setDateFormat(MotionOcean::DATETIME_FORMAT)
    @image.created_at.should.equal dateFormatter.dateFromString("2012-04-09T11:17:11Z")
  end

end

describe MotionOcean::Image, ".find_by_slug" do

  it "should return a single image with the given slug" do
    MotionOcean::Image.find_by_slug("centos-5-8-x64") do |image, error|
      @image = image
      resume
    end

    wait do
      @image.is_a?(MotionOcean::Image).should.equal true
    end
  end

  it "should assign all properties" do
    @image.id.should.equal           1601
    @image.name.should.equal         "CentOS 5.8 x64"
    @image.distribution.should.equal "CentOS"
    @image.slug.should.equal         "centos-5-8-x64"
    @image.public.should.equal       true
    @image.regions.should.equal      ["nyc1", "ams1", "sfo1", "nyc2", "ams2", "sgp1", "lon1", "nyc1"]

    dateFormatter = NSDateFormatter.new
    dateFormatter.setDateFormat(MotionOcean::DATETIME_FORMAT)
    @image.created_at.should.equal dateFormatter.dateFromString("2012-04-09T11:17:11Z")
  end

end
