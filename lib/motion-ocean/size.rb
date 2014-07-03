module MotionOcean

  class Size < MotionOcean::Base
    attr_accessor :disk,           :memory,   :price_hourly,
                  :price_monthly,  :regions,  :slug,
                  :transfer,       :vcpus

    alias_method :cpus, :vcpus
  end

end
