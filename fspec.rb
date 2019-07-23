# frozen_string_literal: true.
require 'rubygems'
require 'nokogiri'
require 'open-uri'

 # Création d'un fichier et de son spec
 @chemin = Dir.pwd
 
 def fspec
    puts "quel est le nom du fichier ? mettre nom du dossier apres la commande "
    print ">"
    nom = STDIN.gets.chomp.split(' ')
    file = File.open("#{@chemin}""/""#{nom[1]}""/""lib""/""#{nom[0]}.rb", "w+")
    rspec = File.open("#{@chemin}""/""#{nom[1]}""/""spec/""#{nom[0]}_spec.rb", "w+")
    rspec.close
    file.close
 end
    fspec   
