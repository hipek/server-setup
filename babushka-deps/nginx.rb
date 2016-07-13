dep 'nginx', :host do
  requires 'nginx.remote_bin'.with(host),
    'nginx.register'.with(host)
end

dep 'nginx.remote_bin', :host

dep 'nginx.register', :host do
  port '80'
end
