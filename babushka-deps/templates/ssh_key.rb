meta :ssh_key do
  accepts_value_for :username, :basename

  def ssh_path
    '~/.ssh'
  end

  template {
    met? {
      ssh(host).shell "su - #{username} -c 'ls #{ssh_path}/id_rsa'"
    }

    meet {
      ssh(host).shell "su - #{username} -c 'mkdir ~/.ssh'"
      ssh(host).shell "su - #{username} -c 'ssh-keygen -q -t rsa -f #{ssh_path}/id_rsa -N \"\"'"
    }
  }
end
