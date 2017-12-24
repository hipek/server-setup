dep 'ischedule' do
  host ||= ENV['HOST']
  requires 'tools'.with(host),
           'git.remote_bin'.with(host),
           'nginx-passenger'.with(host),
           'deploy.useradd'.with(host),
           'deploy.ssh_key'.with(host),
           'deploy.sudoer'.with(host),
           'rvm.remote_bin'.with(host, 'deploy'),
           'ruby242.rvm'.with(host)
end

dep 'deploy.useradd', :host
dep 'deploy.ssh_key', :host
dep 'deploy.sudoer', :host
dep 'ruby242.rvm', :host do
  username 'deploy'
  name 'ruby'
  version '2.4.2'
end
