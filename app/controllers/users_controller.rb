class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    if @user != current_user
      @own_books = @user.own_books.order('created_at DESC')
    else
      @own_books = @user.own_books
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Bienvenue ! Commence sans plus attendre à ajouter tes livres !" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    puts "\n" * 50
    puts user_params
    @city = City.find_by(name: user_params[:city])
    if @city.nil?
      @city = City.create(name: user_params[:city], zip_code: user_params[:zip_code])
    end
    puts "\n" * 50
    puts "USER = #{user_params[:street_name]}   OTHER_INFO == #{user_params[:other_information]}"
    @private_address = PrivateAddress.create(street_name: user_params[:street_name], other_information: user_params[:other_information], city: @city, user: @user)
    @private_address.errors
      

    respond_to do |format|
      if @user.update(name: user_params[:name], biography: user_params[:biography], private_address: @private_address)
        format.html { redirect_to @user, notice: "Les modifications sont bien enregistrées." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Votre compte est bien détruit." }
      format.json { head :no_content }
    end
  end

#  def books_in_loan_request
#    @books_in_loan_request = []
#    @user.borrowers.each { |loan| @borrowed_books << loan.own_book if loan.is_past == false && loan.accepted == false }
#  end
#
#  def borrowed_books
#    @borrowed_books = []
#    @user.borrowers.each { |loan| @borrowed_books << loan.own_book if loan.is_past == false && loan.accepted }
#  end
#
#  def loaned_books
#    @loaned_books = []
#    @user.lenders.each { |loan| @loaned_books << loan.own_book if loan.is_past == false && loan.accepted }
#  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :biography, :city, :zip_code, :street_name, :other_information)
    end
end
