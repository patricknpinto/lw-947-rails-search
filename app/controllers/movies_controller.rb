class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.where('title ilike ?', "%#{params[:query]}%")
      # @movies = Movie.global_search(params[:query])
      @results = PgSearch.multisearch(params[:query])
    else
      @movies = Movie.all
    end
  end
end
