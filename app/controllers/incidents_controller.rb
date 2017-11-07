class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_officer, only: [:edit, :update, :show, :destroy, :new, :index]
 autocomplete :animal, :animalsname,  :full => true,:extra_data => [:code]
  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all
    @incidents = @incidents.order('whenfound desc')
   
    
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
      @animals=Animal.first
  end

  # GET /incidents/new
  def new
   
    @incident = Incident.new
    
     if params[:search]
      @animals = Animal.animalsname_like("%#{params[:search]}%").order('animalsname')
      @animals= @animals.first
    
    else
  @animals=nil
  end
end

  # GET /incidents/1/edit
  def edit
      @animals=Animal.first
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)

 
    respond_to do |format|
    if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
   #This method is here just so Comment can use validates_associated
  def marked_for_destruction?
    false
  end

  def valid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:code, :officer, :reason, :whenfound, :wherefound,:animals)
    
    end
    
    def animal_params
    params.require(:animal).permit(:animals)
  end
    
     def logged_in_officer
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
