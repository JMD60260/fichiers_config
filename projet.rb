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
 # Creation dossier projet, dossier lib, dossier db, app,, views 
 # Fichiers README, .gitignore, .env, app.rb, index, done
def lib_app_view_db_read
   Dir.mkdir("#{@chemin}/#{$nom}/lib")
   Dir.mkdir("#{@chemin}/#{$nom}/lib/app")
   Dir.mkdir("#{@chemin}/#{$nom}/lib/views")
   Dir.mkdir("#{@chemin}/#{$nom}/db")
   Dir.mkdir("#{@chemin}/#{$nom}/Autres_fichiers")
   file = File.open("#{@chemin}/#{$nom}/README.md", "w+")
   file.puts ("Ceci est le README du dossier : ""#{$nom}")
   file.puts ("J'ai initialise ton Rspec et ton git")
   file.puts ("J'ai cree ton gemfile et initialise bundle install")
   file.puts ("J'ai cree les fichiers et dossiers suivants :")
   file.puts (" /lib, gitignore, gemfile, gemfilelock, readme, app repli")
   file.puts ("en tapant tf puis nom de fichier espace nom de dossier")
   file.puts ("tu cree le fichier et son spec")
   file.close
    
end
 # done file
def done
   file = File.open("#{@chemin}/#{$nom}/lib/views/done.rb", "w+")
   file.close
end
 # index file
def index
   file = File.open("#{@chemin}/#{$nom}/lib/views/index.rb", "w+") 
   file.close
end
# Initialize app.rb
def app_rb
   file = File.open("#{@chemin}/#{$nom}/app.rb", "w+")
   file.puts ("require 'bundler'")
   file.puts ("Bundler.require")
   file.puts (" ")
   file.puts ("unshift File.expand_path("./../lib", __FILE__)")
file.close
end
# Initialiwe gitignore
def gitignore
   file = File.open("#{@chemin}/#{$nom}/Autres_fichiers/.gitignore", "w+")
end
# Initialise fichier .env
def env
   file = File.open("#{@chemin}/#{$nom}/Autres_fichiers/.env")#
   file.close
end
 # Intialisation git et rspec
def git_rspec
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
def perform
    lib_app_view_db_read
    done
    index
    app_rb
    #gitignore
    env
    git_rspec
    gemfile 
    system("git add .")
    system("git commit -m 'first commit README'") 
    system("git remote add origin git@github.com:JMD60260/""#{$nom}"".git") 
end
