meta :nginx_site do
  accepts_value_for :sitename, :basename

  def nginx_path
    '/etc/nginx'
  end

  def available_sites
   File.join nginx_path, 'sites-available'
  end

  def enabled_sites
    File.join nginx_path, 'sites-enabled'
  end

  def temp_path
    "tmp/#{sitename}"
  end

  def nginx_local_site_file
    "nginx-sites/#{sitename}.erb"
  end

  def read_sha1
    FileSha1.read temp_path
  end

  template {
    met? {
      render_erb nginx_local_site_file, :to => temp_path
      log "Checking file #{enabled_sites}/#{sitename}"
      ssh(host).shell "cat #{enabled_sites}/#{sitename} | grep '#{read_sha1}'"
    }

    meet {
      `scp #{temp_path} #{host}:#{available_sites}/#{sitename}`
      ssh(host).shell "cd #{enabled_sites} && ln -sf ../sites-available/#{sitename} #{sitename}"
      log "New file #{available_sites}/#{sitename} uploaded"
    }
  }
end
