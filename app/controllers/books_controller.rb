class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  # GET /books or /books.json
  def index
    @books = Book.all.reverse
  end

  # GET /books/1 or /books/1.json
  def show
    @own_book = OwnBook.find_by(book: @book)
  end

  # GET /books/new
  def new
    @isbn = params[:isbn]
    @title = params[:title]
    @authors = params[:authors]
    @publisher = params[:publisher]
    @published_date = params[:published_date]
    @language = params[:language]
    @description = params[:description]
    @image_link = params[:image_link]
    

    @query_errors = []
    @query_errors << 'Mince, ton livre est si rare que nous n\'avons pas pu le trouver !' if params[:successful] == 'false'
    @query_errors << 'Merci d\'indiquer l\'ISBN (le numéro du code barre est généralement situé derrière le livre !)' if params[:is_empty] != nil
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    if params[:isbn_fill] then
      if params[:isbn_fill][:isbn] == '' then
        redirect_to action: 'new',
        successful: true,
        is_empty: true
        return
      end

      books = GoogleBooks.search('isbn:' << params[:isbn_fill][:isbn])
      book = books.first
      
      if book == nil then
        redirect_to action: 'new',
        successful: false
      else
        redirect_to action: 'new',
        successful: true,
        isbn: params[:isbn_fill][:isbn],
        title: book.title,
        authors: book.authors,
        publisher: book.publisher,
        published_date: book.published_date,
        language: book.language,
        description: book.description,
        image_link: book.image_link
      end

    else
      if params[:book][:shelf] != nil
        params[:book][:shelf] = params[:book][:shelf].upcase
      end

      @book = Book.new(book_params)


      if @book.save then
        @own_book = OwnBook.create(user: current_user, book: @book, available: true)
        redirect_to root_path
      else
        puts "\n" * 50 
        puts "HELLO LELELEL"
        render 'new', no_reset: true
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        @own_book = @book.own_books.find_by(user: current_user)
        format.html { redirect_to @own_book, notice: "Les données du livre ont bien été mises à jour." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:isbn, :title, :authors, :publisher, :published_date, :language, :description, :image_link, :own_book)
    end
  end
