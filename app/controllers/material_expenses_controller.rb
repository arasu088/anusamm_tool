class MaterialExpensesController < ApplicationController
  before_action :set_material_expense, only: %i[ show edit update destroy ]

  # GET /material_expenses or /material_expenses.json
  def index
    c=[]
    if params[:project_id] && params[:project_id].to_i>0
      c<<"project_id=#{ params[:project_id].to_i}"
    end
    if params[:material_id] && params[:material_id].to_i>0
      c<<"material_id=#{ params[:material_id].to_i}"
    end
    if params[:supplier_id] && params[:supplier_id].to_i>0
      c<<"supplier_id=#{ params[:supplier_id].to_i}"
    end
    if params[:start_date] && params[:start_date]!=""
      c<<"date>='#{ params[:start_date]}'"
    end 
    if params[:end_date] && params[:end_date]!=""
      c<<"date<='#{ params[:end_date]}'"
    end 
    if c.empty?
      @material_expenses = MaterialExpense.all.order("date")
    else
      c=c.join(' and ') 
      @material_expenses = MaterialExpense.where(c).order("date")
    end
    @total=@material_expenses.sum(:total_amount)
  end

  # GET /material_expenses/1 or /material_expenses/1.json
  def show
  end

  # GET /material_expenses/new
  def new
    @material_expense = MaterialExpense.new
  end

  # GET /material_expenses/1/edit
  def edit
  end

  # POST /material_expenses or /material_expenses.json
  def create
    @material_expense = MaterialExpense.new(material_expense_params)

    respond_to do |format|
      if @material_expense.save
        format.html { redirect_to material_expenses_path, notice: "Material expense was successfully created." }
        format.json { render :show, status: :created, location: @material_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @material_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_expenses/1 or /material_expenses/1.json
  def update
    respond_to do |format|
      if @material_expense.update(material_expense_params)
        format.html { redirect_to material_expenses_path, notice: "Material expense was successfully updated." }
        format.json { render :show, status: :ok, location: @material_expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @material_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_expenses/1 or /material_expenses/1.json
  def destroy
    @material_expense.destroy
    respond_to do |format|
      format.html { redirect_to material_expenses_url, notice: "Material expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_expense
      @material_expense = MaterialExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_expense_params
      params.require(:material_expense).permit(:project_id, :material_id, :supplier_id, :date, :quantity, :amount, :gst, :total_amount)
    end
end
