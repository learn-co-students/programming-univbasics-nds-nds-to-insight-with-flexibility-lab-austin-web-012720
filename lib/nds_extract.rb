# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
# Your code after this point

def movies_with_director_key(name, movie_collection)
movies = []
index = 0
 while index < movie_collection.length do 
   movies << movie_with_director_name(name, movie_collection[index])
   index += 1
 end
  movies
  end
  # GOAL: For each Hash in an Array (movies_collection), provide a collection of movies and a directors name to the movie_with_director_name method and accumulate the returned Array of movies into a new Array that's returned by this method.
  
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a :director_name key. This addition can be done by using the provided movie_with_director_name method

def gross_per_studio(collection)
  result = {}  #result will be key(studio) => value(total gross)
  index = 0 
 while index < collection.length do 
   if !result[collection[index][:studio]]
   result[collection[index][:studio]] = collection[index][:worldwide_gross]
 else
   result[collection[index][:studio]] += collection[index][:worldwide_gross]
 end
 index += 1 
end 
result
end
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  # RETURN:
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

def movies_with_directors_set(movie_collection)
  movies_by_director = []
  index = 0 
#set up the loop to first isolate the director hash, then get the name and movie data from that hash
  while index < movie_collection.length do 
    directors_info = movie_collection[index] #used binding.pry to save all of one directors info to a new variable
    directors_name = directors_info[:name] #used binding.pry to save the directors name to a new variable
    directors_movies = directors_info[:movies] #used binding.pry to save all of one directors movies to a new variable
    movies_by_director << movies_with_director_key(directors_name, directors_movies)
  index += 1
  end
  movies_by_director
end
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end