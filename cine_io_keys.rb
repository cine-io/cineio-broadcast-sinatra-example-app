class CineIoKeys

  def self.publicKey
    new.keys.fetch(:publicKey)
  end

  def self.secretKey
    new.keys.fetch(:secretKey)
  end

  def keys
    if ENV['VCAP_SERVICES']
      fetch_from_pivotal
    elsif ENV['CINE_IO_PUBLIC_KEY'] && ENV['CINE_IO_SECRET_KEY']
      fetch_from_heroku
    else
      {publicKey: nil, secretKey: nil}
    end
  end

  private

  def fetch_from_pivotal
    vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
    credentials = vcap_services.fetch('cine-io')[0].fetch('credentials')
    {
      publicKey: credentials.fetch('publicKey'),
      secretKey: credentials.fetch('secretKey')
    }
  end

  def fetch_from_heroku
    {
      publicKey: ENV['CINE_IO_PUBLIC_KEY'],
      secretKey: ENV['CINE_IO_SECRET_KEY']
    }
  end
end
