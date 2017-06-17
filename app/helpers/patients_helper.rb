module PatientsHelper
  def has_public_key?(patient)
    patient.publickey
  end
end
