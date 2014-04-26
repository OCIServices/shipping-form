class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.all
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    shipment = Shipment.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.pdf { send_file ShippingPdfForm.new(shipment).export, type: 'application/pdf' }
    end
  end

  # GET /shipments/1/pdf
  def pdf
    shipment = Shipment.find(params[:id])
    send_file ShippingPdfForm.new(shipment).export, type: 'application/pdf'
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
    @offices = Office.order(:name).all
  end

  # GET /shipments/1/edit
  def edit
    @offices = Offices.all
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:address_type, :company, :attention, :address1, :address2, :address3, :zip, :city, :telephone, :sender_name, :sender_email, :sender_phone, :changepoint_code, :delivery, :delivery_specifics, :return_label, :signature, :state, :insurance, :insurance_amount, :country, :email, :contents, :instructions)
    end
end
