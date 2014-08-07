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
    key = 'all_sets'
    return Rails.cache.read(key) if Rails.cache.exist?(key)

    l = get_data(EXPANSION_SERVICE, '')
    l.map! { |x| MtgDbSet.new(x) }
    Rails.cache.write(key, l)
    l
  end

  def self.cards_in_expansion_by_id(id)
    key = "expansion_cards_#{id}"
    return Rails.cache.read(key) if Rails.cache.exist?(key)

    url = "#{WEBSERVICE_URL}/#{EXPANSION_SERVICE}/#{id}/cards"
    cards = HTTParty.get(url).parsed_response.map { |x| MtgDbCard.new(x) }
    Rails.cache.write(key, cards)
    cards
  end

  def self.get_data(service, query)
    query = query.to_s.gsub(/[\W,]/, '%20')
    url = "#{WEBSERVICE_URL}/#{service}/#{query}"
    HTTParty.get(url).parsed_response
  end

  # Do a text search by card name
  def self.search_card_by_name(search)
    key = "card_search_#{search}"
    return Rails.cache.read(key) if Rails.cache.exist?(key)

    if search && search != ""
      l = search_by_name(search)
      l = sort_cards(l.map { |x| MtgDbCard.new(x) })
    end
    Rails.cache.write(key, l)
    l
  end

  # Find cards by (exact) expansion
  def self.find_by_expansion(expansion)
    key = "cards_in_expansion_#{expansion}"
    return Rails.cache.read(key) if Rails.cache.exist?(key)

    l = sort_cards(
          cards_in_expansion_by_id(expansion)
          .map { |x| MtgDbCard.new(x) })

    Rails.cache.write(key, l)
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
