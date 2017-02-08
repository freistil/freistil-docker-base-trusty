require "serverspec"
require "docker"
require "open3"

set :backend, :docker
set :os, family: "ubuntu", arch: "x86_64"

# TODO https://github.com/swipely/docker-api/issues/202
Excon.defaults[:ssl_verify_peer] = false

if ENV['CIRCLECI']
	# Monkeypatch, see https://circleci.com/docs/docker#docker-exec
  module Docker
    class Container
      def exec(command, opts = {}, &block)
        command[2] = command[2].inspect
        cmd = %Q{sudo lxc-attach -n #{self.id} -- #{command.join(' ')}}
        stdin, stdout, stderr, wait_thread = Open3.popen3 cmd
        [stdout.read, [stderr.read], wait_thread.value.exitstatus]
      end

      def remove(options={})
        # do not delete container
      end
      alias_method :delete, :remove
      alias_method :kill, :remove
    end
  end
end
