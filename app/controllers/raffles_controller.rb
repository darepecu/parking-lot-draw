class RafflesController < ApplicationController
  before_action :set_raffle, only: [:show, :edit, :update, :destroy]

  # GET /raffles
  # GET /raffles.json
  def index
    @raffles = Raffle.all
  end

  # GET /raffles/1
  # GET /raffles/1.json
  def show
  end

  # GET /raffles/new
  def new
    @raffle = Raffle.new 
    
    if Parking.where(assigned: nil, parking_type: 'DISCA').count > 0
      @parking_raffle = Parking.where(assigned: nil, parking_type: 'DISCA').sample
      @applicant_raffle = Applicant.where(assigned: nil, vehicle_type: 'DISCA').sample
    elsif Parking.where(assigned: nil, parking_type: 'MOTO').count > 0
      @parking_raffle = Parking.where(assigned: nil, parking_type: 'MOTO').sample
      @applicant_raffle = Applicant.where(assigned: nil, vehicle_type: 'MOTO').sample
    elsif Parking.where(assigned: nil, parking_type: 'AUTO').count > 0
      @parking_raffle = Parking.where(assigned: nil, parking_type: 'AUTO').sample
      @applicant_raffle = Applicant.where(assigned: nil, vehicle_type: 'AUTO').sample
    end

  end

  # GET /raffles/1/edit
  def edit
    @parking_raffle = Parking.find_by(id: @raffle.parking_id)
    @applicant_raffle = Applicant.find_by(id: @raffle.applicant_id)
  end

  # POST /raffles
  # POST /raffles.json
  def create
    @raffle = Raffle.new(raffle_params)

    if @raffle.assigned?

      parking_raffle = Parking.find_by(id: raffle_params['parking_id'])
      parking_raffle.assigned = true
      parking_raffle.save

      applicant_raffle = Applicant.find_by(id: raffle_params['applicant_id'])
      applicant_raffle.assigned = true 
      applicant_raffle.save 

    end

    respond_to do |format|
      if @raffle.save
        format.html { redirect_to @raffle, notice: 'Raffle was successfully created.' }
        format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raffles/1
  # PATCH/PUT /raffles/1.json
  def update

    if raffle_params_update['assigned'].eql?('0')

      parking_raffle = Parking.find_by(id: raffle_params['parking_id'])
      parking_raffle.assigned = nil
      parking_raffle.save

      applicant_raffle = Applicant.find_by(id: raffle_params['applicant_id'])
      applicant_raffle.assigned = nil 
      applicant_raffle.save 

    elsif raffle_params_update['assigned'].eql?('1')

      parking_raffle = Parking.find_by(id: raffle_params['parking_id'])
      parking_raffle.assigned = true
      parking_raffle.save

      applicant_raffle = Applicant.find_by(id: raffle_params['applicant_id'])
      applicant_raffle.assigned = true 
      applicant_raffle.save  
    end

    respond_to do |format|
      if @raffle.update(raffle_params_update)
        format.html { redirect_to @raffle, notice: 'Raffle was successfully updated.' }
        format.json { render :show, status: :ok, location: @raffle }
      else
        format.html { render :edit }
        format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raffles/1
  # DELETE /raffles/1.json
  def destroy
    @raffle.destroy
    respond_to do |format|
      format.html { redirect_to raffles_url, notice: 'Raffle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raffle
      @raffle = Raffle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raffle_params
      params.require(:raffle).permit(:assigned, :applicant_id, :parking_id)
    end

    def raffle_params_update
      params.require(:raffle).permit(:assigned)
    end
end
