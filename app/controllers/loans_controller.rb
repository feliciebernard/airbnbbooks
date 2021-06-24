class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]
  before_action :find_own_book, only: %i[create destroy update]
  before_action :authenticate_user!

  # GET /loans or /loans.json
  def index
    @borrowers = Loan.where(borrower: current_user)
    @lenders = Loan.where(lender: current_user)
  end

  # GET /loans/1 or /loans/1.json
  def show
    @loan = @own_book.book
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans or /loans.json
  def create
    @own_book.update(available: false)
    @loan = Loan.new(borrower: current_user, lender: @own_book.user, own_book: @own_book)

   UserMailer.ask_owner_to_borrow_his_book(@own_book, current_user).deliver_now


    respond_to do |format|
      if @loan.save
        format.html { redirect_back(fallback_location: root_path, notice: "La demande d'emprunt a été envoyé au propriétaire du livre.") }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render root_path, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    @loan = Loan.find(params[:id])
    UserMailer.request_accepted(@loan).deliver_now
    #redirect_back(fallback_location: root_path)
    respond_to do |format|
      
      if @loan.update(is_accepted: true)
        format.html { redirect_back(fallback_location: root_path) }
    
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    @own_book.update(available: true)
    @loan.destroy
    UserMailer.request_declined(@loan).deliver_now

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      puts "\n" * 50
      puts "PARAMS = #{params}"
      @loan = Loan.find(params[:id])
    end

    def find_own_book
      @own_book = OwnBook.find(params[:own_book_id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan, :own_book_id)
    end
end
