module MtgDbAPI

  WEBSERVICE_URL = 'http://api.mtgdb.info/'
  CARD_SERVICE = 'cards'
  SEARCH_SERVICE = 'search'
  EXPANSION_SERVICE = 'sets'

  def self.card_by_id(id)
    get_data(CARD_SERVICE, id)
  end

  def self.cards_by_name(name)
    get_data(CARD_SERVICE, name)
  end

  def self.search_by_name(name)
    get_data(SEARCH_SERVICE, name)
  end

  def self.expansion_by_id(id)
    get_data(EXPANSION_SERVICE, id)
  end

  def self.get_data(service, query)
    url = "#{WEBSERVICE_URL}/#{service}/#{query}"
    HTTParty.get(url).parsed_response
  end
end
