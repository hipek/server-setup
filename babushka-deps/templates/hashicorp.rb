meta :hashicorp do
  accepts_value_for :name
  accepts_value_for :version

  def dest_path
    '/usr/local/bin'
  end

  def source
    'https://releases.hashicorp.com'
  end

  template {
    met? { ssh(host).shell "which #{name}" }

    meet {
      ssh(host)
        .shell "cd /tmp && wget #{source}/#{name}/"\
                "#{version}/#{name}_#{version}_linux_amd64.zip && "\
                "cd /tmp && unzip #{name}*.zip && cp #{name} #{dest_path}"
    }
  }
end
