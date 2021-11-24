class LabourPaymentsController < ApplicationController
  before_action :set_labour_payment, only: %i[ show edit update destroy ]

  # GET /labour_payments or /labour_payments.json
  def index
    c=[]
    if params[:project_id] && params[:project_id].to_i>0
      c<<"project_id=#{ params[:project_id].to_i}"
    end
    if params[:labour_type_id] && params[:labour_type_id].to_i>0
      c<<"labour_type_id=#{ params[:labour_type_id].to_i}"
    end
    if params[:labour_id] && params[:labour_id].to_i>0
      c<<"labour_id=#{ params[:labour_id].to_i}"
    end
    if params[:start_date] && params[:start_date]!=""
      c<<"date>='#{ params[:start_date]}'"
    end 
    if params[:end_date] && params[:end_date]!=""
      c<<"date<='#{ params[:end_date]}'"
    end 
    if c.empty?
      @labour_payments = LabourPayment.all.order("date")
    else
      c=c.join(' and ') 
      @labour_payments = LabourPayment.where(c).order("date")
    end
    @total=@labour_payments.sum(:amount)    
  end

  # GET /labour_payments/1 or /labour_payments/1.json
  def show
  end

  # GET /labour_payments/new
  def new
    @labour_payment = LabourPayment.new
  end

  # GET /labour_payments/1/edit
  def edit
  end

  # POST /labour_payments or /labour_payments.json
  def create
    @labour_payment = LabourPayment.new(labour_payment_params)

    respond_to do |format|
      if @labour_payment.save
        format.html { redirect_to labour_payments_path, notice: "Labour payment was successfully created." }
        format.json { render :show, status: :created, location: @labour_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @labour_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labour_payments/1 or /labour_payments/1.json
  def update
    respond_to do |format|
      if @labour_payment.update(labour_payment_params)
        format.html { redirect_to labour_payments_path, notice: "Labour payment was successfully updated." }
        format.json { render :show, status: :ok, location: @labour_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @labour_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labour_payments/1 or /labour_payments/1.json
  def destroy
    @labour_payment.destroy
    respond_to do |format|
      format.html { redirect_to labour_payments_url, notice: "Labour payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def getlabour
    @labour_type_id=params[:labour_type_id].to_i
    respond_to do |format|
      format.js {}
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labour_payment
      @labour_payment = LabourPayment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def labour_payment_params
      params.require(:labour_payment).permit(:project_id, :labour_type_id, :labour_id, :date, :amount)
    end
end
