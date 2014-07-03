module MotionOcean

  class Key < MotionOcean::Base
    attr_accessor :fingerprint, :name, :public_key

    def self.api_name
      "ssh_key"
    end

    def self.api_path
      "/account/keys"
    end
  end

end
