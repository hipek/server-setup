meta :docker_img do
  accepts_value_for :name, :basename

  template {
    met? {
      ssh(host).shell "docker images | grep #{name}"
    }

    meet {
      log "Installing docker image #{name}..."
      ssh(host).shell "docker pull #{name} > /dev/null"
    }
  }
end
