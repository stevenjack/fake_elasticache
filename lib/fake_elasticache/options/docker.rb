module FakeElasticache
  module Options
    module Docker

      def parse
        options = {
          :port      => ENV.fetch('FAKEELASTICACHE_PORT', '11212'),
          :bind      => ENV.fetch('FAKEELASTICACHE_BIND','127.0.0.1'),
          :servers   => [],
          :version   => ENV.fetch('MEMCACHED_VERSION', '2.4.14')
        }

        ENV.keys.select { |key| key.to_s.match(/^MEMCACHED[0-9]*_PORT$/) }.each do |linked_container|

          memcached_server = ENV[linked_container].sub("tcp://", "").split(':')
          ip               = ENV.fetch('FAKEELASTICACHE_DEFAULT_HOST', memcached_server[0])
          port             = ENV.fetch('FAKEELASTICACHE_DEFAULT_PORT', memcached_server[1])
          hostname         = ENV.fetch("DNS#{linked_container[/\d+/,0]}_NAME", 'localhost')

          options[:servers] << "#{hostname}|#{ip}|#{port}"
        end
        options
      end

      module_function :parse
    end
  end
end
