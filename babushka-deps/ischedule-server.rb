dep 'ischedule' do
  host ||= ENV['HOST']
  requires 'tools'.with(host),
           'git.remote_bin'.with(host),
           'nginx-passenger'.with(host)
end
