class LaboursController < ApplicationController
  before_action :set_labour, only: %i[ show edit update destroy ]

  # GET /labours or /labours.json
  def index
    @labours = Labour.all
  end

  # GET /labours/1 or /labours/1.json
  def show
  end

  # GET /labours/new
  def new
    @labour = Labour.new
  end

  # GET /labours/1/edit
  def edit
  end

  # POST /labours or /labours.json
  def create
    @labour = Labour.new(labour_params)

    respond_to do |format|
      if @labour.save
        format.html { redirect_to labours_path, notice: "Labour was successfully created." }
        format.json { render :show, status: :created, location: @labour }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labours/1 or /labours/1.json
  def update
    respond_to do |format|
      if @labour.update(labour_params)
        format.html { redirect_to labours_path, notice: "Labour was successfully updated." }
        format.json { render :show, status: :ok, location: @labour }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labours/1 or /labours/1.json
  def destroy
    if @labour.destroy
    respond_to do |format|
      format.html { redirect_to labours_url, notice: "Labour was successfully destroyed." }
      format.json { head :no_content }
    end
  else
    respond_to do |format|
      format.html { redirect_to labours_url, notice: "ERROR - Association available" }
      format.json { head :no_content }
    end
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labour
      @labour = Labour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def labour_params
      params.require(:labour).permit(:name, :number, :is_active, :labour_type_id)
    end
end
