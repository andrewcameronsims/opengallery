# frozen_string_literal: true

class Painting
  def self.get_urls(urls = 100)
    img_urls = []
    api_response = HTTP.get("https://www.rijksmuseum.nl/api/en/collection/?key=8dqtwY6x&ps=#{urls}&format=json")
    rijksmuseum = JSON.parse(api_response)
    rijksmuseum['artObjects'].each do |ao|
      img_urls << ao['webImage']['url']
    end
    img_urls
  end
end
