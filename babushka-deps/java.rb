dep 'java', :host do
  requires 'java.source'.with(host), 'java.remote_bin'.with(host)
end

dep 'java.source', :host do
  met? {
    ssh(host).shell 'cat /etc/apt/sources.list.d/webupd8team-java.list'
  }

  meet {
    ssh(host) do |r|
      r.shell "echo \"deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main\" | tee /etc/apt/sources.list.d/webupd8team-java.list"
      r.shell "echo \"deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main\" | tee -a /etc/apt/sources.list.d/webupd8team-java.list"
      r.shell "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886"
      r.shell "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"
      r.shell "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections"
    end
  }
end

dep 'java.remote_bin', :host do
  name 'oracle-java8-installer'
end
