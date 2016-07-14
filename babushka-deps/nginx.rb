dep 'nginx', :host do
  requires 'nginx.remote_bin'.with(host),
    'nginx.register'.with(host)
end

dep 'nginx.remote_bin', :host

dep 'nginx.register', :host do
  requires_when_unmet 'consul'.with(host)
  port '80'
end
