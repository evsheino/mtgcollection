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

  def self.all_expansions
    get_data(EXPANSION_SERVICE, '')
  end

  def self.cards_in_expansion_by_id(id)
    key = "expansion_cards_#{id}"
    return Rails.cache.read(key) if Rails.cache.exist?(key)

    url = "#{WEBSERVICE_URL}/#{EXPANSION_SERVICE}/#{id}/cards"
    cards = HTTParty.get(url).parsed_response
    Rails.cache.write(key, cards)
    cards
  end

  def self.get_data(service, query)
    query = query.to_s.gsub(/[\W,]/, '%20')
    key = "#{service}_#{query}"
    return Rails.cache.read(key) if Rails.cache.exist?(key)

    url = "#{WEBSERVICE_URL}/#{service}/#{query}"
    r = HTTParty.get(url).parsed_response

    Rails.cache.write(key, r)
    r
  end

  # Do a text search by card name
  def self.search_card_by_name(search)
    if search && search != ""
      sort_cards(search_by_name(search))
    end
  end

  # Find cards by (exact) expansion
  def self.find_by_expansion(expansion)
    sort_cards(cards_in_expansion_by_id(expansion))
  end

  # Search by card name and expansion.
  # If either is blank, only the other is used.
  def self.search(name, expansion)
    name = nil if name == ''
    expansion = (expansion == '' || expansion == nil) ? nil : expansion.upcase

    cards = []
    if name
      cards = search_card_by_name(name)
    elsif expansion
      # Only expansion specified
      return find_by_expansion(expansion)
    end

    if cards && expansion
      # Filter cards by expansion
      cards.select! { |x| x['cardSetId'] == expansion }
    end

    cards || []
  end

  def self.sort_cards(cards)
    cards.sort_by! { |card| [card['name'], card['cardSetId']] }
  end
end
