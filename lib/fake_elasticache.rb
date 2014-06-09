require "fake_elasticache/version"
require "fake_elasticache/options"
require "fake_elasticache/options/docker"
require "fake_elasticache/server"
require "eventmachine"

module FakeElasticache

  def self.run!
    EventMachine.run {
      EventMachine.start_server options[:bind], options[:port], FakeElasticache::Server, options
    }
  end

  private

  def self.options
    @@options ||= ENV['CONTAINER'].nil? ? FakeElasticache::Options.parse : FakeElasticache::Options::Docker.parse
  end

end
