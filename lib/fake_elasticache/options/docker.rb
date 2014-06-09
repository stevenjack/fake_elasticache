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

        ENV.keys.select { |key| key.to_s.match(/^MEMCACHED[0-9]*_PORT/) }.each do |linked_container|
          id = linked_container[/\d+/,0]
          memcached_server = ENV[linked_container].nil? ? ['127.0.0.1', '11211'] : ENV[linked_container].sub("tcp://", "").split(':')
          options[:servers] << "#{ENV.fetch("DNS#{id}_NAME", 'localhost')}|#{memcached_server[0]}|#{memcached_server[1]}"
        end
        options
      end

      module_function :parse
    end
  end
end
