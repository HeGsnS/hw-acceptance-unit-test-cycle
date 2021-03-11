require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    # GET index
    describe "GET index" do
      it "assigns all movies as @movies" do
        movie = Movie.create!(title: "valid title", rating: "PG")
        get :index
        expect(assigns(:movies)).to eq [movie]
      end
      it "redirects to movies" do
        get :index, {:sort => 'title'}
        expect(response).to redirect_to :ratings => assigns(:selected_ratings),
                                        :sort => 'title'
      end
      it "redirects to movies" do
        get :index, {:sort => 'release_date'}
        expect(response).to redirect_to :ratings => assigns(:selected_ratings),
                                        :sort => 'release_date'
      end
    end
    # GET show
    describe "GET show" do
      it "assigns the requested movie as @movie" do
        movie = Movie.create!(title: "valid title")
        get :show, {:id => movie.to_param}
        expect(assigns(:movie)).to eq movie
      end
    end
    # GET edit
    describe "GET edit" do
      it "assigns the requested movie as @movie" do
        movie = Movie.create!(title: "valid title")
        get :edit, {:id => movie.to_param}
        expect(assigns(:movie)).to eq movie
      end
    end
    # Put update
    describe "Put update" do
        it "assigns the requested movie as @movie" do
            movie = Movie.create!(title: 'Advenger')
            put :update, {:id => movie.to_param, :movie => {"title" => "new title"}}
            expect(assigns(:movie)).to eq movie
            expect(flash[:notice]).to eq "new title was successfully updated."
            expect(response).to redirect_to(movie)
      end
    end
    # Get search
    describe "Get search" do
        it "searches similar movies" do
            movie_1 = Movie.create!(title: 'Advenger', director: 'guanchu')
            movie_2 = Movie.create!(title: 'X-men', director: 'guanchu')
            get :search_directors, {:id => movie_1.to_param}
            expect(assigns(:movies)).to eq [movie_1, movie_2]
            expect(assigns(:movie)).to eq movie_1
        end
        it "searches movies with no director" do
            movie_1 = Movie.create!(title: 'Advenger', director: '')
            get :search_directors, {:id => movie_1.to_param}
            expect(assigns(:movie)).to eq movie_1
            expect(flash[:notice]).to eq "'Advenger' has no director info"
            expect(response).to redirect_to movies_path
        end
    end
    
end
