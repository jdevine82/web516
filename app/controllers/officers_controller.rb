class OfficersController < ApplicationController
  before_action :set_officer, only: [:show, :edit, :update, :destroy]
 before_action :logged_in_officer, only: [:edit, :update]
  # GET /officers
  # GET /officers.json
  def index
    @officers = Officer.all
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
      @user = Officer.find(params[:id])
  end

  # GET /officers/new
  def new
    @officer = Officer.new
  end

  # GET /officers/1/edit
  def edit
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = Officer.new(officer_params)

    respond_to do |format|
      if @officer.save
        log_in(@officer)
        format.html { redirect_to @officer, notice: 'Officer was successfully created.' }
        format.json { render :show, status: :created, location: @officer }
      else
        format.html { render :new }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officers/1
  # PATCH/PUT /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to @officer, notice: 'Officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to officers_url, notice: 'Officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_officer
      @officer = Officer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def officer_params
      params.require(:officer).permit(:id,:first_name,:last_name, :number, :password, :password_confirmation)
    end
    def logged_in_officer
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
