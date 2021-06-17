class PrivateAdressesController < ApplicationController
  before_action :set_private_adress, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /private_adresses or /private_adresses.json
  def index
    @private_adresses = PrivateAdress.all
  end

  # GET /private_adresses/1 or /private_adresses/1.json
  def show
  end

  # GET /private_adresses/new
  def new
    @private_adress = PrivateAdress.new
  end

  # GET /private_adresses/1/edit
  def edit
  end

  # POST /private_adresses or /private_adresses.json
  def create
    @private_adress = PrivateAdress.new(private_adress_params)

    respond_to do |format|
      if @private_adress.save
        format.html { redirect_to @private_adress, notice: "Private adress was successfully created." }
        format.json { render :show, status: :created, location: @private_adress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @private_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_adresses/1 or /private_adresses/1.json
  def update
    respond_to do |format|
      if @private_adress.update(private_adress_params)
        format.html { redirect_to @private_adress, notice: "Private adress was successfully updated." }
        format.json { render :show, status: :ok, location: @private_adress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @private_adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_adresses/1 or /private_adresses/1.json
  def destroy
    @private_adress.destroy
    respond_to do |format|
      format.html { redirect_to private_adresses_url, notice: "Private adress was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_adress
      @private_adress = PrivateAdress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def private_adress_params
      params.require(:private_adress).permit(:street_name, :other_information)
    end
end
