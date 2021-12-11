class AbstractQuantitiesController < ApplicationController
  before_action :set_abstract_quantity, only: %i[ show edit update destroy ]

  # GET /abstract_quantities or /abstract_quantities.json
  def index
    c=[]
    if params[:project_id] && params[:project_id].to_i>0
      c<<"project_id=#{ params[:project_id].to_i}"
    end
    if params[:material_type_id] && params[:material_type_id].to_i>0
      c<<"m.material_type_id=#{ params[:material_type_id].to_i}"
    end    
    if c.empty?
      @abstract_quantities = AbstractQuantity.all
    else
      c=c.join(' and ') 
      @abstract_quantities = AbstractQuantity.joins("inner join materials m on m.id=abstract_quantities.material_id").where(c)
    end        
    @total=@abstract_quantities.sum(:total)
  end

  # GET /abstract_quantities/1 or /abstract_quantities/1.json
  def show
  end

  # GET /abstract_quantities/new
  def new
    @abstract_quantity = AbstractQuantity.new
  end

  # GET /abstract_quantities/1/edit
  def edit
  end

  # POST /abstract_quantities or /abstract_quantities.json
  def create
    @abstract_quantity = AbstractQuantity.new(abstract_quantity_params)

    respond_to do |format|
      if @abstract_quantity.save
        format.html { redirect_to abstract_quantities_path, notice: "Abstract quantity was successfully created." }
        format.json { render :show, status: :created, location: @abstract_quantity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @abstract_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abstract_quantities/1 or /abstract_quantities/1.json
  def update
    respond_to do |format|
      if @abstract_quantity.update(abstract_quantity_params)
        format.html { redirect_to abstract_quantities_path, notice: "Abstract quantity was successfully updated." }
        format.json { render :show, status: :ok, location: @abstract_quantity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @abstract_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstract_quantities/1 or /abstract_quantities/1.json
  def destroy
    @abstract_quantity.destroy
    respond_to do |format|
      format.html { redirect_to abstract_quantities_url, notice: "Abstract quantity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abstract_quantity
      @abstract_quantity = AbstractQuantity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def abstract_quantity_params
      params.require(:abstract_quantity).permit(:project_id, :material_id, :quantity, :amount, :total, :gst)
    end
end
