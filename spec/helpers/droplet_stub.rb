class DropletStub

  def initialize(app)
    @app = app
  end

  def call(request)
    status = 200
    headers = {
      "Status" => "200 OK",
      "Content-Type" => "application/json; charset=utf-8"
    }

    url = request.URL.absoluteString
    api_path = "#{MotionOcean::API_BASE_URL}#{MotionOcean::Droplet.api_path}"
    file_path = "#{NSBundle.mainBundle.resourcePath}/api#{MotionOcean::Droplet.api_path}"

    if url.start_with?("#{api_path}/12345")
      data = File.open("#{file_path}/find.json").read.to_data
      sleep 0.1
    elsif url.start_with?(api_path)
      data = File.open("#{file_path}/all.json").read.to_data
      sleep 0.1
    else
      status, headers, data = @app.call(request)
    end

    return status, headers, data
  end

end
