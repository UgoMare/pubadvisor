require 'open-uri'
require 'nokogiri'

Pub.destroy_all

url = "http://www.timeout.com/london/bars-and-pubs/the-100-best-bars-and-pubs-in-london"
html = open(url)
doc = Nokogiri::HTML(html)

doc.search('.feature-item').each do |pub|
  image = pub.search('.image_wrapper img')[0].attr('src')
  name = pub.search('h3 a')[0].text
  location = pub.search('.listings_flag')[0].text.strip
  description = pub.search('.feature-item__column p').map(&:to_s).join.strip
  Pub.create!(name: name, location: location, image: image, description: description)
end

