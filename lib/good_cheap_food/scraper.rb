class Scraper
  def self.scrape_restaurant_list
    html = open("http://nymag.com/srch?t=restaurant&N=265+336+1148+375&No=0&Ns=nyml_sort_name%7C0")
    doc = Nokogiri::HTML(html)

    rest_arr = []

    rest_name_link = doc.css(".criticsPick a")
    rest_name_link.each do |element|
      rest_arr << {name: element.text, profile_url: element["href"]}
    end

    rest_arr
  end

  def self.scrape_restaurant_profile(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)

    attributes = {}

    street_addr = doc.css(".street-address").text
    locality = doc.css(".locality").text
    region = doc.css(".region").text
    zip = doc.css(".postal-code").text
    address = street_addr + ", " + locality + ", " + region + " " + zip

    attributes[:address] = address

  end
end
