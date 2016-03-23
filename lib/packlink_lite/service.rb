module PacklinkLite
  class Service
    PATH = 'services'

    def self.all(query)
      PacklinkLite.client.get(PATH, query)
    end
  end
end
