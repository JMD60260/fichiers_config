# frozen_string_literal: true.
require 'nokogiri'
require 'open-uri'
require 'watir'

@chemin = Dir.pwd
  puts "Quel est le nom du dossier à créer ?"
  print ">"
  $nom = STDIN.gets.chomp.to_s
Dir.mkdir("#{@chemin}/#{$nom}")
Dir.chdir "#{$nom}"
@geminit = ["'rspec'", "'pry'", "'rubocop', '~>0.57.2'", "'twitter'", "'dotenv'", "'nokogiri'", "'watir','~>6.16'", "'launchy'"]
 # Creation dossier projet, dossier lib, dossier db, app,, views 
 # Fichiers README, .gitignore, .env, app.rb, index, done
def lib_app_view_db_read
   Dir.mkdir("#{@chemin}/#{$nom}/lib")
   Dir.mkdir("#{@chemin}/#{$nom}/lib/app")
   Dir.mkdir("#{@chemin}/#{$nom}/lib/views")
   Dir.mkdir("#{@chemin}/#{$nom}/db")
   readme = File.open("#{@chemin}/#{$nom}/README.md", "w+")
   readme.puts ("Ceci est le README du dossier : ""#{$nom}")
   readme.puts ("J'ai initialise ton Rspec et ton git")
   readme.puts ("J'ai cree ton gemfile et initialise bundle install")
   readme.puts ("J'ai cree les fichiers et dossiers suivants :")
   readme.puts (" /lib, gitignore, gemfile, gemfilelock, readme, app repli")
   readme.puts ("en tapant tf puis nom de fichier espace nom de dossier")
   readme.puts ("tu cree le fichier et son spec")
   readme.close   
end
 # done file
def done
   done = File.open("#{@chemin}/#{$nom}/lib/views/done.rb", "w+")
   done.close
end
 # index file
def index
   index = File.open("#{@chemin}/#{$nom}/lib/views/index.rb", "w+") 
   index.close
end
# Initialize app.rb
def app_rb
   app = File.open("#{@chemin}/#{$nom}/app.rb", "w+")
   app.puts ("require 'bundler'")
   app.puts ("Bundler.require")
   app.puts (" ")
   app.puts ("unshift File.expand_path(\"./../lib\", __FILE__)")
   app.close
end
# Initialiwe gitignore
   def gitignore
      gitignore = File.open("#{@chemin}/#{$nom}/.gitignore", "w+")
      gitignore.puts (".env")
      gitignore.puts (".DS_Store")
      gitignore.close
   end
# Initialise fichier .env
   def env
      env = File.open("#{@chemin}/#{$nom}/.env", "w+")
      env.close
   end
 # Intialisation git et rspec
def git_rspec
   system("git init")
   system("rspec --init")
end
 # Création du fichier Gemfile et Gemlock
def gemfile
   i = 0
   gemfile = File.open("#{@chemin}/#{$nom}/Gemfile", "w+")
   gemfile.puts("source 'https://rubygems.org'")
   gemfile.puts("ruby '2.5.1'")
  while i < @geminit.size
       puts "Veux tu ""#{@geminit[i]} ?" + " " + ("y/n")
        a =STDIN.gets.chomp.to_s
       if a = "y" || a = "Y"
           gemfile.puts ("gem " + "#{@geminit[i]}")
           i +=1
       else
           i = i
       end
   end 
     gemfile.close
      system("bundle install") 
end 
def perform
    lib_app_view_db_read
    done
    index
    app_rb
    gitignore
    env
    git_rspec
    gemfile 
   #  system("git add .")
   #  system("git commit -m 'first commit README'") 
   #  system("git remote add origin git@github.com:JMD60260/""#{$nom}"".git") 
end
perform