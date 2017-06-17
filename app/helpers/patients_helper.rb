module PatientsHelper
  def has_public_key?(patient)
    patient.publickey.present?
  end
end
