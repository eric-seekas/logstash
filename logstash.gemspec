Gem::Specification.new do |spec|
  files = []
  dirs = %w{lib examples etc patterns test}
  dirs.each do |dir|
    files += Dir["#{dir}/**/*"]
  end

  #rev = %x{svn info}.split("\n").grep(/Revision:/).first.split(" ").last.to_i
  rev = Time.now.strftime("%Y%m%d%H%M%S")
  spec.name = "logstash"
  spec.version = "0.2.#{rev}"
  spec.summary = "logstash - log and event management"
  spec.description = "scalable log and event management (search, archive, pipeline)"
  spec.license = "Apache License (2.0)"

  spec.add_dependency("eventmachine-tail")
  spec.add_dependency("json")
  #spec.add_dependency("awesome_print")

  # For http requests (elasticsearch, etc)
  spec.add_dependency("em-http-request")

  # For the 'grok' filter
  #spec.add_dependency("jls-grok", ">= 0.2.3071")

  # TODO: In the future, make these optional
  # for websocket://
  spec.add_dependency("em-websocket")

  # For amqp://
  spec.add_dependency("amqp", "~> 0.6.5") # amqp 0.7.0 is incompatible for now.
  spec.add_dependency("uuidtools")

  # For the web interface
  spec.add_dependency("async_sinatra")
  spec.add_dependency("rack")
  spec.add_dependency("thin")
  spec.add_dependency("haml")

  # For beanstalk://
  #spec.add_dependency("em-jack")

  spec.files = files
  spec.require_paths << "lib"
  spec.bindir = "bin"
  spec.executables << "logstash"
  spec.executables << "logstash-web"
  spec.executables << "logstash-test"

  spec.authors = ["Jordan Sissel", "Pete Fritchman"]
  spec.email = ["jls@semicomplete.com", "petef@databits.net"]
  spec.homepage = "http://code.google.com/p/logstash/"
end

