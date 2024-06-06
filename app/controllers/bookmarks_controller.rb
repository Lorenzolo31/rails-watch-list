class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(list: @list, movie: @movie)
    if @bookmark.save
      redirect_to @list, notice: 'Film ajouté à la liste avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list, notice: 'Film retiré de la liste avec succès.'
  end
end

