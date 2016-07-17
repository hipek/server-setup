dep 'jenkins', :host do
  requires 'tools'.with(host),
    'jenkins.docker_img'.with(host),
    'jenkins.remote_dir'.with(host),
    'jenkins.docker_start'.with(host),
    'jenkins.register'.with(host)
end

dep 'jenkins.docker_img', :host do
  requires_when_unmet 'docker'.with(host)
  tag 'alpine'
end

dep 'jenkins.remote_dir', :host do
  name '/home/jenkins'
  chmod 'og+rw'
end

dep 'jenkins.docker_start', :host do
  tag 'alpine'
  params '-p 8090:8080 -p 50000:50000 -v /home/jenkins:/var/jenkins_home'
end

dep 'jenkins.register', :host do
  requires_when_unmet 'consul'.with(host)
  port '8090'
  tags 'http-service'
end
