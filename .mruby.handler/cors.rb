Proc.new do |env|
  origin = env["HTTP_ORIGIN"]

  # logger = env["rack.errors"]
  # logger.p(origin)

  if origin.nil?
    next [403, {}, []]
  end

  unless origin.end_with?("jxck.io") || origin.end_with?("mozaic.fm")
    # should from my Domain
    next [403, {}, []]
  end

  headers = {
    "Access-Control-Allow-Origin"=> origin,
    "Vary" => "origin"
  }
  [399, headers, []]
end
