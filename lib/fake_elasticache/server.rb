require 'eventmachine'

module FakeElasticache

  class Server < EventMachine::Connection
    attr_reader :options

    def initialize(options)
      @options = options
      super
    end

    def receive_data data
      if data =~ /stats/i
        send_data "STAT version #{options[:version]}\nEND\n"
      elsif data =~ /config get cluster|get AmazonElastiCache:cluster/i
        send_data config_output
      elsif data =~ /quit/i
        close_connection
      else
        send_data "Command: #{data} is unexpected\n"
      end
    end

    private

    def config_output
      config_string = options[:servers].join(" ")
      "CONFIG cluster 0 #{config_string.length}\n1\n#{config_string}\n\nEND\n"
    end

  end
end
