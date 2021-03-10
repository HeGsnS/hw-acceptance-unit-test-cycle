require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "returns similar movies" do
    movie_1 = Movie.create(title: 'Iron Man', director: 'guanchu')
    movie_2 = Movie.create(title: 'X-Men', director: 'guanchu')
    movie_3 = Movie.create(title: 'Captain America', director: 'wang')
    movie_4 = Movie.create(title: 'Advenger', director: 'guanchu')
    expect(Movie.find_similar_movies('guanchu')).to eq [movie_1, movie_2, movie_4]
  end
end
