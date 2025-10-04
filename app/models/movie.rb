class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings_list)
    # if ratings_list is nil or empty, retrieve ALL movies
    if ratings_list.nil? || ratings_list.empty?
      Movie.all
    else
      # Case-insensitive search for movies with specified ratings
      Movie.where('LOWER(rating) IN (?)', ratings_list.map(&:downcase))
    end
  end
end
