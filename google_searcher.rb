# frozen_string_literal: true.
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir'
require 'launchy'

 # Verifie la présence de text après la commande
def check_if_user_gave_input
    abort("Que cherchez vous ? \n Entrez votre recherche à la suite de votre commande \n Example: Ruby google_search.rb Comment dresser un chien") if ARGV.empty?
end
 # Récupère les éléments de la demande dans un Array 
def gets_demande
    ARGV
end
 # Construit une url à partir des données pour une recherche google
def url_recherche
    url = "https://www.google.com/search?q=#{gets_demande.join('+')}."
end
 # Lance la recherche google
def recherche(url_recherche)
    Launchy.open("#{url_recherche}")
end

def perform
    check_if_user_gave_input
    recherche(url_recherche)
end
perform