require "net/empty_port/version"
require "socket"

module Net
  module EmptyPort
    class << self
      def empty_port(port = 0, proto = :tcp)
        port  = random_port unless valid_port?(port)

        while (port += 1) < 60000
          next if (proto == :tcp and used?(port))

          begin
            TCPServer.new('127.0.0.1', port).close
            return port
          rescue Errno::EADDRINUSE, Errno::EACCES
          end
        end
      end

      def used?(port, proto = :tcp)
        if proto == :udp
          udp_used?(port)
        else
          tcp_used?(port)
        end
      end

      def wait(port, max_wait, proto = :tcp)
        waiter = make_waiter(max_wait)
        while waiter.call
          return true if used?(port, proto)
        end
        return false
      end

      private

      def valid_port?(port)
        num = Integer(port)
        if (num < 49152 or num > 65535)
          false
        else
          true
        end
      rescue
        false
      end

      def random_port
        50000 + (rand * 1000).to_i
      end

      def tcp_used?(port)
        TCPSocket.new('127.0.0.1', port).close
        true
      rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
        false
      end

      def udp_used?(port)
        UDPSocket.new().bind('127.0.0.1', port)
        false
      rescue Errno::EADDRINUSE, Errno::EACCES
        true
      end

      def make_waiter(max_wait)
        waited = 0
        interval = 0.001
        Proc.new {
          next false if waited > max_wait
          sleep interval
          waited += interval
          interval *= 2
          next true
        }
      end
    end
  end
end
