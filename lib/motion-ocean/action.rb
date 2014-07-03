module MotionOcean

  class Action < MotionOcean::Base
    attr_accessor :completed_at,  :disk,           :region,
                  :resource_id,   :resource_type,  :started_at,
                  :status,        :type

    def completed_at=(value)
      if value.is_a?(String)
        value = datetime_from_string(value)
      end
      super
    end

    def started_at=(value)
      if value.is_a?(String)
        value = datetime_from_string(value)
      end
      super
    end
  end

end
