module PacklinkLite
  class Service
    PATH = 'services'

    def self.find(query)
      PacklinkLite.client.get(PATH, query)
    end
  end
end
