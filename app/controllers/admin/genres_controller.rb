class Admin::GenresController < ApplicationController

  def index
    @admins_genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.seve
      @admins_genres = Genre.all
      redirect_to admin_genres_path
    else
      @admins_genres = Genre.all
      render :index
    end
  end

  def edit
    @admins_genres = Genre.find(params[:id])
  end

  def update
  end

end
