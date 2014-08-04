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

  def self.cards_in_expansion_by_id(id)
    url = "#{WEBSERVICE_URL}/#{EXPANSION_SERVICE}/#{id}/cards"
    HTTParty.get(url).parsed_response
  end

  def self.get_data(service, query)
    query = query.to_s.gsub(/[\W,]/, '%20')
    url = "#{WEBSERVICE_URL}/#{service}/#{query}"
    HTTParty.get(url).parsed_response
  end

  # Do a text search by card name
  def self.search_card_by_name(search)
    return Rails.cache.read(search) if Rails.cache.exist?(search)

    if search && search != ""
      l = search_by_name(search)
      l = sort_cards(l.map { |x| MtgDbCard.new(x) })
    end
    Rails.cache.write(search, l)
    l
  end

  # Find cards by (exact) expansion
  def self.find_by_expansion(expansion)
    return Rails.cache.read(expansion) if Rails.cache.exist?(expansion)

    l = sort_cards(
          cards_in_expansion_by_id(expansion)
          .map { |x| MtgDbCard.new(x) })

    Rails.cache.write(expansion, l)
    l
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
      cards.select! { |x| x.cardSetId == expansion }
    end

    cards || []
  end

  def self.sort_cards(cards)
    cards.sort_by! { |card| [card.name, card.cardSetId] }
  end
end
