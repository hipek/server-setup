meta :rvm do
  accepts_value_for :name, :basename
  accepts_value_for :version
  accepts_value_for :username

  template {
    met? {
      ssh(host).shell "su - #{username} -c 'rvm list | grep #{name}-#{version}'"
    }

    meet {
      ssh(host).shell "su - #{username} -c 'rvm install #{name}-#{version}'"
      ssh(host).shell "su - #{username} -c 'rvm use #{name}-#{version} --default'"
      ssh(host).shell "su - #{username} -c 'gem install bundler --no-ri --no-rdoc'"
    }
  }
end
