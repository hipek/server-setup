dep 'setup', :host do
  requires 'tools'.with(host),
    'nginx'.with(host),
    'consul'.with(host),
    'nginx.register'.with(host)
end
