class EngineersController < ApplicationController
  before_action :set_engineer, only: [:show, :edit, :update, :destroy]

  # GET /engineers
  # GET /engineers.json
  def index
    @engineers = Engineer.all.order(service_center_id: :asc)
  end

  # GET /engineers/1
  # GET /engineers/1.json
  def show
  end

  # GET /engineers/new
  def new
    @engineer = Engineer.new
    @service_centers = ServiceCenter.all
    if @service_centers.blank?
      flash[:no_sc_error] = "Any service centers are not registered yet. Create a service center first."
      redirect_to new_service_center_path
    end
  end

  # GET /engineers/1/edit
  def edit
    @service_centers = ServiceCenter.all
  end

  # POST /engineers
  # POST /engineers.json
  def create
    @engineer = Engineer.new(engineer_params)
    @service_centers = ServiceCenter.all

    respond_to do |format|
      if @engineer.save
        format.html { redirect_to @engineer, notice: 'Engineer was successfully created.' }
        format.json { render :show, status: :created, location: @engineer }
      else
        format.html { render :new }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engineers/1
  # PATCH/PUT /engineers/1.json
  def update
    respond_to do |format|
      if @engineer.update(engineer_params)
        format.html { redirect_to @engineer, notice: 'Engineer was successfully updated.' }
        format.json { render :show, status: :ok, location: @engineer }
      else
        format.html { render :edit }
        format.json { render json: @engineer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineers/1
  # DELETE /engineers/1.json
  def destroy
    @engineer.destroy
    respond_to do |format|
      format.html { redirect_to engineers_url, notice: 'Engineer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engineer
      @engineer = Engineer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engineer_params
      params.require(:engineer).permit(:name, :service_center_id)
    end
end
