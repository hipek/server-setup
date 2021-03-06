dep 'docker', :host do
  requires 'lsb_release.remote_bin'.with(host)

  met? {
    ssh(host).shell 'which docker'
  }

  def lsb_release(arg)
    ssh(host).shell("lsb_release --#{arg}").split(/:\s+/).last.strip
  end

  def system_id
    lsb_release('id').downcase
  end

  def codename
    lsb_release('codename').downcase
  end

  meet {
    ssh(host) do |r|
      r.shell "apt-get install apt-transport-https ca-certificates -yy && "\
              "apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 "\
              "--recv-keys 58118E89F3A912897C070ADBF76221572C52609D && "\
              "echo 'deb https://apt.dockerproject.org/repo #{system_id}-#{codename} main' "\
              "> /etc/apt/sources.list.d/docker.list && "\
              "apt-get update && apt-get install docker-engine -yy > /dev/null"
    end
  }
end
