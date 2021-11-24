class LabourTypesController < ApplicationController
  before_action :set_labour_type, only: %i[ show edit update destroy ]

  # GET /labour_types or /labour_types.json
  def index
    @labour_types = LabourType.all
  end

  # GET /labour_types/1 or /labour_types/1.json
  def show
  end

  # GET /labour_types/new
  def new
    @labour_type = LabourType.new
  end

  # GET /labour_types/1/edit
  def edit
  end

  # POST /labour_types or /labour_types.json
  def create
    @labour_type = LabourType.new(labour_type_params)

    respond_to do |format|
      if @labour_type.save
        format.html { redirect_to labour_types_path, notice: "Labour type was successfully created." }
        format.json { render :show, status: :created, location: @labour_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @labour_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labour_types/1 or /labour_types/1.json
  def update
    respond_to do |format|
      if @labour_type.update(labour_type_params)
        format.html { redirect_to labour_types_path, notice: "Labour type was successfully updated." }
        format.json { render :show, status: :ok, location: @labour_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @labour_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labour_types/1 or /labour_types/1.json
  def destroy
  if @labour_type.destroy
    respond_to do |format|
      format.html { redirect_to labour_types_url, notice: "Labour type was successfully destroyed." }
      format.json { head :no_content }
    end
  else
    respond_to do |format|
      format.html { redirect_to labour_types_url, notice: "ERROR - Association available" }
      format.json { head :no_content }
    end
  end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labour_type
      @labour_type = LabourType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def labour_type_params
      params.require(:labour_type).permit(:name, :is_active)
    end
end
