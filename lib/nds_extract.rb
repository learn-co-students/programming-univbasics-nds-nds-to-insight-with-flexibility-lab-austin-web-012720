

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
  for i in 0...movies_collection.length do
      movies_collection[i][:director_name] = name
  end
  return movies_collection
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  pp collection[0]
  studios_totals = {}
  for i in 0...collection.length do
      if collection[i].key?(:movies)
        for j in 0...collection[i][:movies].length do
              if studios_totals.key?(collection[i][:movies][j][:studio])
                studios_totals[collection[i][:movies][j][:studio]] += collection[i][:movies][j][:worldwide_gross]
              else
                studios_totals[collection[i][:movies][j][:studio]] = collection[i][:movies][j][:worldwide_gross]
              end
        end
      else
        if studios_totals.key?(collection[i][:studio])
          studios_totals[collection[i][:studio]] += collection[i][:worldwide_gross]
        else
          studios_totals[collection[i][:studio]] = collection[i][:worldwide_gross]
        end
      end
  end
  return studios_totals
end

def movies_with_directors_set(source)
  arr = []
  for i in 0...source.length do 
     for j in 0...source[i][:movies].length do 
          source[i][:movies][j][:director_name] = source[i][:name]
      end
      set = {:director_name => source[i][:name], :movies => source[i][:movies]}
      a = []
      a << set
      arr << a
  end
  arr
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
