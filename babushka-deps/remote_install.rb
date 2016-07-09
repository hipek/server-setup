dep 'remote_install.babushka', :host do
  ssh(host) do |remote|
    met? {
      remote.shell 'which babushka'
    }

    meet {
      remote.shell 'apt-get update && apt-get install ruby lsb-release -yy'
      `scp vendor/cache/babushka-*.gem #{host}:/tmp/`
      remote.shell 'cd /tmp && gem install babushka-*.gem'
    }
  end
end

dep 'remote_install.deps', :host do
  remote_dir = '/opt/babushka-deps'
  files = Dir.entries('remote-deps/').reject { |name| %w'. ..'.include?(name) }

  ssh(host) do |remote|
    met? {
      files.all? { |file|
        remote.shell "ls #{remote_dir}/#{file}"
      }
    }

    meet {
      remote.shell "mkdir -p #{remote_dir}"
      `scp remote-deps/* #{host}:#{remote_dir}/`
    }
  end
end
