dep 'ischedule' do
  host ||= ENV['HOST']
  requires 'tools'.with(host),
           'git.remote_bin'.with(host),
           'nginx-passenger'.with(host),
           'deploy.useradd'.with(host),
           'deploy.ssh_key'.with(host),
           'deploy.sudoer'.with(host),
           'rvm.remote_bin'.with(host, 'deploy'),
           'ruby242.rvm'.with(host),
           'screen.remote_bin'.with(host),
           'rtorrent.remote_bin'.with(host),
           'nodejs.remote_bin'.with(host),
           'peter.nginx_site'.with(host)
end

dep 'nodejs.remote_bin', :host
dep 'screen.remote_bin', :host
dep 'rtorrent.remote_bin', :host
dep 'deploy.useradd', :host
dep 'deploy.ssh_key', :host
dep 'deploy.sudoer', :host
dep 'ruby242.rvm', :host do
  username 'deploy'
  name 'ruby'
  version '2.4.2'
end

dep 'peter.nginx_site', :host
