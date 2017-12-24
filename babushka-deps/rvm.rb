dep 'rvm.remote_bin', :host, :username do
  requires 'curl.remote_bin'.with(host),
           'sudo.remote_bin'.with(host)

  met? {
    ssh(host).shell "su - #{username} -c 'cat ~/.bashrc | grep rvm'"
  }

  meet{
    ssh(host) do |r|
      r.shell "su - #{username} -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys "\
              "409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'"
      r.shell "su - #{username} -c 'curl -sSL https://get.rvm.io | bash -s stable'"
    end
  }
end
