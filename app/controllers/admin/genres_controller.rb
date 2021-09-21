class Admin::GenresController < ApplicationController

  def index
    @admins_genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      @admins_genres = Genre.all
      redirect_to admin_genres_path(@genre.id)
    else
      @admins_genres = Genre.all
      render "index"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      @admins_genres = Genre.all
      flash[:notice] = "You have updated genre successfully."
      redirect_to admin_genres_path
    else
      render "edit"
    end

  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
