module MotionOcean

  class Droplet < MotionOcean::Base
    attr_accessor :action_ids,    :backup_ids,  :image,
                  :kernel,        :locked,      :name,
                  :networks,      :region,      :size,
                  :snapshot_ids,  :status

    def image=(value)
      if value.is_a?(Hash)
        value = MotionOcean::Image.new(value)
      end
      super
    end

    def kernel=(value)
      if value.is_a?(Hash)
        value = MotionOcean::Kernel.new(value)
      end
      super
    end

    def region=(value)
      if value.is_a?(Hash)
        value = MotionOcean::Region.new(value)
      end
      super
    end

    def size=(value)
      if value.is_a?(Hash)
        value = MotionOcean::Size.new(value)
      end
      super
    end
  end

end
