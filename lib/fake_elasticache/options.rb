require "optparse"

module FakeElasticache
  module Options

    def parse

      options = {
        :port      => 11212,
        :bind      => '127.0.0.1',
        :servers   => ['localhost|127.0.0.1|11211'],
        :version   => ENV.fetch('MEMCACHED_VERSION', '2.4.14')
      }

      OptionParser.new do |opts|
        opts.banner = "Usage: fake_elasticache [options]"

        opts.on("-p", "--port PORT", "Default: #{options[:port]}") do |v|
          options[:port] = v
        end

        opts.on("-b", "--bind ADDR", "Default: #{options[:bind]}") do |v|
          options[:bind] = v
        end

        opts.on("-s", "--servers SERVERS", "Default: #{options[:servers]}") do |v|
          options[:db] = v
        end

      end.parse!
      options
    end

    module_function :parse

  end
end
