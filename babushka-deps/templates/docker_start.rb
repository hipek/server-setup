meta :docker_start do
  accepts_value_for :name, :basename
  accepts_value_for :params

  template {
    met? {
      ssh(host).shell "docker ps | grep #{name}"
    }

    meet {
      log "Starting docker image #{name}..."
      ssh(host).shell "docker rm #{name} || true"
      ssh(host).shell "docker run --restart always --name #{name} --detach #{params} #{name}"
    }
  }
end
