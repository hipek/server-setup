dep 'sudo.remote_bin', :host

meta :sudoer do
  accepts_value_for :username, :basename

  template {
    met? {
      ssh(host).shell "cat /etc/group | grep #{username} | grep sudo"
    }

    meet {
      ssh(host).shell "adduser #{username} sudo"
    }
  }
end
