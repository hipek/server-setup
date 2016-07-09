dep 'setup', :host do
 requires 'remote_install.babushka'.with(host),
  'remote_install.deps'.with(host)
end

dep 'setup.home' do
  requires 'setup'.with 'root@192.168.56.101'
end

dep 'setup.host' do
  requires 'setup'.with ENV['HOST']
end
