class LoansController < ApplicationController
  before_action :set_loan, only: %i[ show edit update destroy loan_is_past]
  before_action :find_own_book, only: %i[create destroy update loan_is_past]
  before_action :authenticate_user!

  # GET /loans or /loans.json
  def index
    @loans_to_current_user = Loan.where(borrower: current_user, is_past: false)
    @loans_by_current_user = Loan.where(lender: current_user, is_past: false)
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

    if @loan.save
      redirect_back(fallback_location: root_path, notice: "La demande d'emprunt a bien été envoyé au propriétaire du livre.")
    else
      render root_path, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /loans/1 or /loans/1.json
  def update
    @loan = Loan.find(params[:id])
    if @loan.update(is_accepted: true)
      redirect_back(fallback_location: root_path, notice: "La demande d'emprunt a bien été accépter, un mail a été envoyer a #{@loan.borrower} pour l'informer")
    else
      redirect_back(fallback_location: root_path, warning: @loan.errors.full_messages.to_s)
    end
  end



  # DELETE /loans/1 or /loans/1.json
  def destroy
    @own_book.update(available: true)
    @loan.destroy
    redirect_back(fallback_location: root_path, notice: "La demande de près de #{@loan.borrower.name} a bien été rejeté")
  end

  def make_it_past
    @loan = Loan.find(params[:loan_id])
    @loan.update(is_past: true)
    redirect_back(fallback_location: root_path, notice: "Un email a été envoyer au propriétaire pour lui informer votre souhait de lui rendre")
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
    def loan_params
      params.require(:loan, :own_book_id)
    end
end
