class VehicleMailer < ApplicationMailer

  def new_vehicle_created(vehicle)
    @vehicle = vehicle
    subject = "New vehicle will arrive on #{vehicle.arrival_date}"
    mail(to: vehicle.showroom.email, subject: subject)
  end
end
