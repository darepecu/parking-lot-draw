class ApplicationController < ActionController::Base
  before_action :get_data
  
  private
  def get_data
    @parking_total_auto = Parking.where(parking_type: 'AUTO').count
    @parking_total_moto= Parking.where(parking_type: 'MOTO').count
    @parking_total_disca = Parking.where(parking_type: 'DISCA').count 

    @applicant_total_auto = Applicant.where(vehicle_type: 'AUTO').count
    @applicant_total_moto = Applicant.where(vehicle_type: 'MOTO').count
    @applicant_total_disca = Applicant.where(vehicle_type: 'DISCA').count

    @parking_total_auto_assigned = Parking.where(parking_type: 'AUTO', assigned: true).count
    @parking_total_moto_assigned = Parking.where(parking_type: 'MOTO', assigned: true).count
    @parking_total_disca_assigned = Parking.where(parking_type: 'DISCA', assigned: true).count
    
    @parking_total_auto_waiting = Parking.where(parking_type: 'AUTO', assigned: nil).count
    @parking_total_moto_waiting = Parking.where(parking_type: 'MOTO', assigned: nil).count
    @parking_total_disca_waiting = Parking.where(parking_type: 'DISCA', assigned: nil).count 

    @applicant_total_auto_waiting = Applicant.where(vehicle_type: 'AUTO', assigned: nil).count
    @applicant_total_moto_waiting = Applicant.where(vehicle_type: 'MOTO', assigned: nil).count
    @applicant_total_disca_waiting = Applicant.where(vehicle_type: 'DISCA', assigned: nil).count

  end
end
