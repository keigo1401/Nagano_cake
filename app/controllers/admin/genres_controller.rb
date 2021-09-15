class Admin::GenresController < ApplicationController

  def index
    @admins_genres = Genre.all
  end

  def create
  end

  def edit
    @admins_genres = Genre.find(params[:id])
  end

  def update
  end

end
