# frozen_string_literal: true

require "docker-api"
require "json"
require "net/http"

module FlareSolverr
  VERSION = "0.1.1"

  def self.request(url, method: :get, cookies: nil)
    args = {
      cmd: "request.#{method}",
      url: url,
      #session: 0, # TODO. Not yet implemented in FlareSolverr 3.x
      cookies: cookies,
      postData: ("todo" if method == :post) # TODO
    }.compact

    response_json = Net::HTTP.post(URI("http://localhost:8191/v1"),
                                   args.to_json,
                                   { "Content-Type" => "application/json" })
                             .body

    JSON.parse(response_json, symbolize_names: true)[:solution]
  end

  def self.create_image
    Docker::Image.create("fromImage" => "flaresolverr/flaresolverr:latest")
  end

  def self.container
    @container ||=
      begin
        create_image

        Docker::Container.create("Image" => "flaresolverr/flaresolverr:latest",
                                 "HostConfig" => {
                                   "PortBindings" => { "8191/tcp" => [{ "HostPort" => "8191" }] }
                                 })
      end
  end
end
