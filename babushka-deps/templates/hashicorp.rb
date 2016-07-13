meta :hashicorp do
  accepts_value_for :name, :basename
  accepts_value_for :version

  def dest_path
    '/usr/local/bin'
  end

  def source
    'https://releases.hashicorp.com'
  end

  def full_name
    "#{name}_#{version}"
  end

  template {
    met? { ssh(host).shell "which #{name}" }

    meet {
      ssh(host)
        .shell "cd /tmp && wget --no-check-certificate #{source}/#{name}/"\
                "#{version}/#{full_name}_linux_amd64.zip && "\
                "cd /tmp && unzip -o #{full_name}_*.zip && cp #{name} #{dest_path} > /dev/null"
    }
  }
end
