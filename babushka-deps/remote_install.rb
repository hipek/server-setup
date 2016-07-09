dep 'remote_install.babushka', :host do
  ssh(host) do |remote|
    met? {
      remote.shell 'which babushka'
    }

    meet {
      remote.shell 'apt-get update && apt-get install ruby -yy'
      `scp vendor/cache/babushka-*.gem #{host}:/tmp/`
      remote.shell 'cd /tmp && gem install babushka-*.gem'
    }
  end
end

dep 'remote_install.deps', :host do
  ssh(host) do |remote|
    remote.shell 'mkdir -p /opt/babushka-deps'
  end
end
