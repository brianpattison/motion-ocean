module MotionOcean
  API_BASE_URL = "https://api.digitalocean.com/v2"
  DATETIME_FORMAT = "yyyy-dd-MM'T'HH:mm:ss'Z'"

  class << self
    attr_accessor :token
  end

  class Base
    attr_accessor :id

    def initialize(params = {})
      params.each do |key, value|
        begin
          self.send("#{key}=", value)
        rescue NoMethodError
          puts "[NOTICE] #{self.class}##{key} has not been implemented. MotionOcean v#{MotionOcean::VERSION}"
        end
      end
      self
    end

    class << self
      attr_reader :api_name, :api_path

      # The name used in JSON strings
      # @return [String]
      def api_name
        self.to_s.split("::").last.downcase
      end

      # The base URL path for the resource
      # @return [String]
      def api_path
        "/#{api_name}s"
      end

      # Finds all records and
      # passes them to the block
      # @param [Hash] options
      # @yield [results, error]
      def all(options = {}, &block)
        url = "#{API_BASE_URL}#{api_path}"

        params = { per_page: 999 }.merge!(options)

        request_manager.GET(url, parameters: params, success: ->(operation, result) {
          records = []

          result["#{api_name}s"].each do |params|
            records << new(params)
          end

          block.call(records, nil) if block
        }, failure: ->(operation, error) {
          block.call(nil, error) if block
        })

        self
      end

      # Finds the record for the ID and
      # passes it to the block
      # @param [Integer] id
      # @yield [result, error]
      def find(id, &block)
        url = "#{API_BASE_URL}#{api_path}/#{id}"

        request_manager.GET(url, parameters: nil, success: ->(operation, result) {
          params = result["#{api_name}"]
          block.call(new(params)) if block
        }, failure: ->(operation, error) {
          block.call(error) if block
        })

        self
      end
    end

  private

    def datetime_from_string(string)
      dateFormatter = NSDateFormatter.new
      dateFormatter.setDateFormat(DATETIME_FORMAT)
      dateFormatter.dateFromString(string)
    end

    def self.request_manager
      manager = AFHTTPRequestOperationManager.manager

      request_serializer = AFHTTPRequestSerializer.serializer
      request_serializer.setValue("Bearer #{MotionOcean.token}", forHTTPHeaderField: "Authorization")
      request_serializer.setValue("application/json", forHTTPHeaderField: "Content-type")

      manager.requestSerializer = request_serializer
      manager.responseSerializer = AFJSONResponseSerializer.serializer

      manager
    end

  end

end
