dep 'jenkins', :host do
  requires 'jenkins.docker_img'.with(host),
    'jenkins.remote_dir'.with(host),
    'jenkins.docker_start'.with(host),
    'jenkins.register'.with(host)
end

dep 'jenkins.docker_img', :host

dep 'jenkins.remote_dir', :host do
  name '/home/jenkins'
end

dep 'jenkins.docker_start', :host do
  params '-p 8080:8080 -p 50000:50000 -v /home/jenkins'
end

dep 'jenkins.register', :host do
  port '8080'
  tags 'http-service'
end
