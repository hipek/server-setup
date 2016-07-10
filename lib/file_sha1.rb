require 'digest/sha1'

class FileSha1
  class << self
    def read(source)
      source.p.read.scan(/from [0-9a-f]{40}+\. [0-9a-f]{40}/).first
    end
  end
end
