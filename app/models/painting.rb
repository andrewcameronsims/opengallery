class Painting
  def self.get_urls
    img_urls = []
    rijksmuseum = HTTP.get(https://www.rijksmuseum.nl/api/en/collection/?key=8dqtwY6x&format=json)
    rijksmuseum = JSON.parse(rijksmuseum)
    rijksmuseum[:artObjects].each do |ao|
      img_urls << ao[:webImage][:url]
    end
    img_urls
  end
end