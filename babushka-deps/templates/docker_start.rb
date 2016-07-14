meta :docker_start do
  accepts_value_for :name, :basename
  accepts_value_for :params
  accepts_value_for :tag

  def image_name
    [name, tag].compact.join(':')
  end

  def container_name
    [name, tag].compact.join('-')
  end

  template {
    met? {
      ssh(host).shell "docker ps | grep #{container_name}"
    }

    meet {
      log "Starting docker container #{container_name}..."
      ssh(host).shell "docker rm #{container_name} || true"
      ssh(host).shell "docker run --restart always --name #{container_name} --detach #{params} #{image_name}"
    }
  }
end
