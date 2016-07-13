dep 'remote_babushka', :host do
  requires 'ruby.remote_bin'.with(host)

  ssh(host) do |remote|
    met? {
      remote.shell 'which babushka'
    }

    meet {
      `scp vendor/cache/babushka-*.gem #{host}:/tmp/`
      remote.shell 'cd /tmp && gem install babushka-*.gem'
    }
  end
end

dep 'ruby.remote_bin', :host
