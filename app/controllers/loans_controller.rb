class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy ]
  before_action :find_own_book, only: %i[create]
  before_action :authenticate_user!

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # GET /loans/1 or /loans/1.json
  def show
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
        format.html { redirect_to root_path, notice: "La demande d'emprunt a été envoyé au propriétaire du livre." }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render root_path, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: "Loan was successfully updated." }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1 or /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: "Loan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    def find_own_book
      @own_book = OwnBook.find(params[:own_book_id])
    end

    # Only allow a list of trusted parameters through.
#    def loan_params
#      params.require(:loan)
#    end
end
