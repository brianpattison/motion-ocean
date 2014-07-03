module MotionOcean

  class Image < MotionOcean::Base
    attr_accessor :created_at, :distribution, :name, :public, :regions, :slug

    def created_at=(value)
      if value.is_a?(String)
        value = datetime_from_string(value)
      end
      super
    end

    class << self
      alias_method :find_by_slug, :find
    end
  end

end
