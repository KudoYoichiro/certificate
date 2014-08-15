class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @makers = Maker.all.order(name: :asc)
    if @makers.blank?
      redirect_to new_maker_path, alert: "Setup is not completed yet. Register maker"
      return
    end
    unless Instrument.exists?
      redirect_to new_instrument_path, alert: "Setup is not completed yet. Register instruments"
      return
    end
    @service_centers = ServiceCenter.all
    if @service_centers.blank?
      redirect_to new_service_center_path, alert: "Setup is not completed yet. Register service centers"
      return
    end
    unless Engineer.exists?
      redirect_to new_engineer_path, alert: "Setup is not complted yet. Register engineers"
      return
    end
    @operations = Operation.all
    if @operations.blank?
      redirect_to new_operation_path, alert: "Setup is not completed yet. Register operatinos"
      return
    end
    unless Status.exists?
      redirect_to new_status_path, alert: "Setup is not complted yet. Register statuses"
      return
    end
    @maker = params[:maker_id].blank? ? @makers.first : Maker.find(params[:maker_id])
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
  end

  # GET /maps/new
  def new
    @map = Map.new
    @service_centers = ServiceCenter.all
    @makers = Maker.all
    @operations = Operation.all
    @statuses = Status.all
  end

  # GET /maps/1/edit
  def edit
    @service_centers = ServiceCenter.all
    @makers = Maker.all
    @operations = Operation.all
    @statuses = Status.all
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  def multi_status_edit_single
    @instrument = Instrument.find(params[:instrument_id])
    @engineer = Engineer.find(params[:engineer_id])
    @operations = Operation.all
    @statuses = Status.all
    
  end
  
  def multi_status_update_single
    instrument = Instrument.find(params[:instrument][:id])
    engineer_id = params[:engineer][:id]
    status_ids = params[:status_id]
    operations = Operation.all
    
    # OPTIMIZE: 高速化が必要
    loop_index = 0
    operations.each do |operation|
      map = Map.find_by(instrument_id: instrument.id, engineer_id: engineer_id, operation_id: operation.id)
      if map.blank?
        map = Map.new(instrument_id: instrument.id, engineer_id: engineer_id, operation_id: operation.id, status_id: status_ids[loop_index])
        map.save
      else
        map.update(status_id: status_ids[loop_index])
      end
      loop_index += 1
    end 
    redirect_to action: :index, maker_id: instrument.maker.id
  end
  
  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:engineer_id, :instrument_id, :operation_id, :status_id)
    end
end
