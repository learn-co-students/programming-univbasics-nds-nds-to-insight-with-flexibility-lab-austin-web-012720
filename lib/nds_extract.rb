# Provided, don't edit
require 'directors_database'

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


def movies_with_director_key(name, movies_collection)
  index = 0 
  director_list = [] 
  #directors list should end up as an array of hashes where each hash is a movie, but each has a :director_name key done using provided movie_with_director method
  
  #name is directors name
  #movies_collection is an array of hashes where each hash represents a movie
  
  while index < movies_collection.size do
    director_list << movie_with_director_name(name, movies_collection[index])
    index += 1
  end
  
  director_list

  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection)

  index = 0 
  studio_gross_hash = {}
  total_gross = 0
  
  while index < collection.length do 
    
      studio_name = collection[index][:studio]
    if !studio_gross_hash.key?(studio_name) then
       studio_gross_hash[studio_name] = 0
    end

    total_gross += collection[index][:worldwide_gross]
    studio_gross_hash[studio_name] += collection[index][:worldwide_gross] 
    index += 1
  end 

  studio_gross_hash


 
  
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #gross_per_studio
  #dane added this pretty print of collection input
  #[{:title=>"Movie A", :studio=>"Alpha Films", :worldwide_gross=>10},
  #{:title=>"Movie B", :studio=>"Alpha Films", :worldwide_gross=>30},
  #{:title=>"Movie C", :studio=>"Omega Films", :worldwide_gross=>30}]
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
end

def movies_with_directors_set(source)
  #source is array of hashes containing director information including :name and :movies
  
  #movies_array = movies_with_director_key(source[:name], source[:movies]) #array of movies with name of director as key

  index = 0 
  director_array = []
  
  while index < source.length do 
    director_information = source[index]
     director_array.push movies_with_director_key(director_information[:name], director_information[:movies])
    index += 1 
  end
  
  director_array
  
  
    
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
