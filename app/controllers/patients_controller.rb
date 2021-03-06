class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!, except: [:show]

  # GET /patients
  # GET /patients.json
  def index
    search = params[:search]
    if search.present?
      @patients = Patient.search_by_fullname(search)
    else
      @patients = Patient.order(:firstname, :lastname)
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    respond_to do |format|
      format.html
      format.json{
        render :json => @patient.to_json({:include => {:medical_attachments => {:methods => :file_url}}})
      }
    end
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        if params[:medical_attachments]
          params[:medical_attachments].each do |medical_attachment|
            @patient.medical_attachments.create(file: medical_attachment)
          end
        end
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
          if params[:medical_attachments]
          params[:medical_attachments].each do |medical_attachment|
            @patient.medical_attachments.create(file: medical_attachment)
          end
        end
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:firstname, :lastname, :birthday, :email, :publickey)
    end
end
