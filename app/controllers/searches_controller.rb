class SearchesController < ApplicationController
  def search  
    if params[:search].blank?  
      redirect_to(root_path, notice: "Il faut taper quelque chose dans la barre de recherche !") and return  
    else
      @own_books = Search.joins(:book, :user).search(params[:search])
      puts "\n" * 50
      puts @own_books.inspect
      puts "\n" * 50
    end  
  end


  private
  def search_params
    params.require(:search).permit(:search)
  end
end