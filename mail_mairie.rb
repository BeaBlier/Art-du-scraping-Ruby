require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_the_email_of_a_townhal_from_its_webpage()    # définition de la méthode
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))   #intégralité du fichier (HTML) sur laquelle je souhaite récupérer un élément.

  ensemble = page.css("tr td p font")   # je définis ma variable ensemble qui à partir de page va sélectionner les balises de types font comprises dans p dans td et dans tr   css ici joue le rôle de filtre     = la portion de texte qui m'intéresse
  ensemble.each do |i|   # la méthode each va analyser/itérer sur chaque élément, appelé i, de ensemble
    if i.text.include?("@")  # include est une méthode qui va permettre de trouver la string contenant @
       puts i.text # j'utilise la fonction each afin de chercher une string contenant @ pour chaque éléments.
    end
  end
end

get_the_email_of_a_townhal_from_its_webpage()    #  exécuter


def get_all_the_urls_of_val_doise_townhalls()  #définition de la méthode
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))  #intégralité du fichier html
  lien = page.css('a') #je définis ma variable lien qui sélectionne les balises a
  lien.each{|lien| print lien['href'] + " "}   # pour chaque élément présent dans lien je sélectionne seulement le href (=lien url)
end


get_all_the_urls_of_val_doise_townhalls()
