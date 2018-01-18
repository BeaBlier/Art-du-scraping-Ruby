require 'rubygems'
require 'nokogiri'
require 'open-uri'

def récupérer_le_cours_de_toutes_les_cryptomonnaies()   #je définis la méthode
page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))   #intégralité du fichier html
name = page.css('.currency-name-container').text  #définition variable name avec les éléments dans la balise a
value = page.css('.price').text #définition variable value avec les éléments dans la balise a

cours_crypto = Hash.new
cours_crypto["name"] = value

cours_crypto.each do |name, value|
  print "The share price of #{name} is #{value}"
  end
end

récupérer_le_cours_de_toutes_les_cryptomonnaies()
