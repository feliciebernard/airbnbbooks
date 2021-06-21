class OwnBooksController < ApplicationController
  before_action :set_own_book, only: %i[show edit update destroy set_available ask_to_borrow_book]
  before_action :authenticate_user!


  # GET /own_books or /own_books.json
  def index

    @own_books = OwnBook.all.order('created_at DESC').filter { |own_book| own_book.available }
    @user = current_user
  end

  # GET /own_books/1 or /own_books/1.json
  def show
   @book = @own_book.book
  end

  # GET /own_books/new
  def new
    @own_book = OwnBook.new
  end

  # GET /own_books/1/edit
  def edit
    @own_book
    @book = @own_book.book
  end

  # POST /own_books or /own_books.json
  def create

    @own_book = OwnBook.new(own_book_params)

    respond_to do |format|
      if @own_book.save
        format.html { redirect_to @own_book, notice: "Own book was successfully created." }
        format.json { render :show, status: :created, location: @own_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @own_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /own_books/1 or /own_books/1.json
  def update
    puts "\n" * 50
    respond_to do |format|
      if @own_book.update(own_book_params)
        format.html { redirect_to @own_book, notice: "Own book was successfully updated." }
        format.json { render :show, status: :ok, location: @own_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @own_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /own_books/1 or /own_books/1.json
  def destroy
    @own_book.destroy
    redirect_back(fallback_location: root_path)
  end

  def set_available
    @own_book.available == true ? @own_book.update(available: false) : @own_book.update(available: true)
    redirect_back(fallback_location: root_path)
  end
  def own_books_in_loan_request
    Loans.find_by()
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_own_book
      @own_book = OwnBook.find(params[:own_book_id])
    end

    # Only allow a list of trusted parameters through.
    def own_book_params
      params.require(:own_book).permit(:user, :own_book)
    end
  end
