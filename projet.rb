# frozen_string_literal: true.
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir'

@chemin = Dir.pwd
  puts "Quel est le nom du dossier à créer ?"
  print ">"
  $nom = STDIN.gets.chomp.to_s
Dir.mkdir("#{@chemin}""/""#{$nom}")
Dir.chdir "#{$nom}"
@geminit = ["'rspec'", "'pry'", "'rubocop', '~>0.57.2'", "'twitter'", "'dotenv'", "'nokogiri'", "'watir','~>6.16'", "'launchy'"]
 # Creation dossier projet, dossier lib, dossier db 
 # Fichiers README, .gitignore, .env, app.rb
def lib
   Dir.mkdir("#{@chemin}""/""#{$nom}""/lib")
   Dir.mkdir("#{@chemin}""/""#{$nom}""/db")
   Dir.mkdir("#{@chemin}""/""#{$nom}""/Autres_fichiers")
   other_file = File.open("#{@chemin}""/""#{$nom}""/Autres_fichiers/.env")
   other_file2 = File.open("#{@chemin}""/""#{$nom}""/Autres_fichiers/.gitignore")
   app_file = File.open("#{@chemin}""/""#{$nom}""/app.rb", "w+")
   file = File.open("#{@chemin}""/""#{$nom}""/README.md", "w+")
   file.puts ("Ceci est le README du dossier : ""#{$nom}")
   file.puts ("J'ai initialise ton Rspec et ton git")
   file.puts ("J'ai cree ton gemfile et initialise bundle install")
   file.puts ("J'ai cree les fichiers et dossiers suivants :")
   file.puts (" /lib, gitignore, gemfile, gemfilelock, readme,")
   file.puts ("en tapant tf puis nom de fichier espace nom de dossier"
   file.puts ("tu cree le fichier et son spec")
   file.close
   other_file.close
   other_file2.close
   app_file.close
end
 # Intialisation git et rspec
def git
   system("git init")
   system("rspec --init")
end
 # Création du fichier Gemfile et Gemlock
def gemfile
   i = 0
   file = File.open("#{@chemin}""/""#{$nom}""/Gemfile", "w+")
   file.puts ("source 'https://rubygems.org'")
   file.puts ("ruby '2.5.1'")
  while i < @geminit.size
       puts "Veux tu ""#{@geminit[i]} ?" + " " + ("y/n")
        a =STDIN.gets.chomp.to_s
       if a = "y" || a = "Y"
           file.puts ("gem " + "#{@geminit[i]}")
           i +=1
       else
           i = i
       end
   end 
     file.close
  system("bundle install") 
end 
def 
def perform
    lib
    git
    gemfile 
    system("git add .")
    system("git commit -m 'first commit README'") 
    #system("git remote add origin git@github.com:JMD60260/""#{$nom}"".git") 
    #system("git push -u origin master")    
end
 perform