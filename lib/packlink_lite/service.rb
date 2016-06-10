module PacklinkLite
  class Service
    PATH = 'services'

    def self.all(query, options = {})
      PacklinkLite.client.get(PATH, query, options)
    end
  end
end
