RackMotion.use KeyStub

describe MotionOcean::Key, ".all" do

  it "should return an array of all SSH keys" do
    @keys = []
    MotionOcean::Key.all do |keys, error|
      @keys = keys
      resume
    end

    wait do
      @keys.is_a?(Array).should.equal true
      @keys.length.should.equal 2
    end
  end

  it "should assign all properties" do
    @key = @keys.first

    @key.id.should.equal          12345
    @key.fingerprint.should.equal "1a:1b:1c:2a:2b:2c:3a:3b:3c:4a:4b:4c:5a:5b:5c:6a"
    @key.public_key.should.equal  "ssh-rsa ABCDEFGHIJKLMNOPQRSTUVWXYZ brian@brianpattison.com"
    @key.name.should.equal        "Brian's MacBook Pro"
  end

end

describe MotionOcean::Key, ".find" do

  it "should return a single key with the given ID" do
    MotionOcean::Key.find(12345) do |key, error|
      @key = key
      resume
    end

    wait do
      @key.is_a?(MotionOcean::Key).should.equal true
    end
  end

  it "should assign all properties" do
    @key.id.should.equal          12345
    @key.fingerprint.should.equal "1a:1b:1c:2a:2b:2c:3a:3b:3c:4a:4b:4c:5a:5b:5c:6a"
    @key.public_key.should.equal  "ssh-rsa ABCDEFGHIJKLMNOPQRSTUVWXYZ brian@brianpattison.com"
    @key.name.should.equal        "Brian's MacBook Pro"
  end

end
