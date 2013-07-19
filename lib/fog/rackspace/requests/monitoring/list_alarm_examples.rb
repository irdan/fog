module Fog
  module Rackspace
    class Monitoring
      class Real

        def list_alarm_examples
          request(
            :expects  => [200, 203],
            :method   => 'GET',
            :path     => 'alarm_examples'
          )
        end
      end

      class Mock

        def list_alarm_examples
          response = Excon::Response.new
          data = Fog::JSON.parse(IO.read(File.join(File.dirname(__FILE__),'mock_files','alarm_examples.json')))
          response.status = data['status']
          response.headers = data['headers']
          response.remote_ip = data['remote_ip']
          response.body = data['body']
          return response
        end
      end
    end
  end
end

