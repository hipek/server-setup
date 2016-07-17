dep 'jenkins', :host do
  requires 'java'.with(host),
    'jenkins.source'.with(host),
    'jenkins.remote_bin'.with(host),
    'jenkins.port'.with(host),
    'jenkins.register'.with(host),
    'jenkins.meteor'.with(host),
    'jenkins.ssh_key'.with(host)
end

dep 'jenkins.source', :host do
  met? {
    ssh(host).shell 'cat /etc/apt/sources.list.d/jenkins.list'
  }

  meet{
    ssh(host) do |r|
      r.shell "wget -q -O - http://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -"
      r.shell "echo 'deb http://pkg.jenkins.io/debian binary/' > /etc/apt/sources.list.d/jenkins.list"
    end
  }
end

dep 'jenkins.remote_bin', :host do
  met? {
    ssh(host).shell 'ls /usr/share/jenkins/jenkins.war'
  }
end

dep 'jenkins.port', :host do
  def config
    '/etc/default/jenkins'
  end

  met? {
    ssh(host).shell "cat #{config} | grep \"HTTP_PORT=8090\""
  }

  meet {
    ssh(host).shell "sed -i '/HTTP_PORT=8080/cHTTP_PORT=8090' #{config}"
    ssh(host).shell "/etc/init.d/jenkins restart"
  }
end
