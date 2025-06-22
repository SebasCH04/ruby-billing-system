class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]

  # GET /invoices
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
 def show
  respond_to do |format|
    format.html
    format.pdf do
      pdf = InvoicePdf.new(@invoice)
      send_data pdf.render,
                filename: "Factura-#{@invoice.number}.pdf",
                type: "application/pdf",
                disposition: "inline"  # o "attachment" para forzar descarga
    end
  end
end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    # Crea una línea vacía para que el form muestre al menos un item
    @invoice.invoice_items.build
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: "Invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy!
    respond_to do |format|
      format.html { redirect_to invoices_path, status: :see_other, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Carga la factura desde params[:id]
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Parámetros permitidos para create/update
  def invoice_params
    params.require(:invoice).permit(
      :client_id, :issued_at, :number, :tax_rate_id,
      invoice_items_attributes: [:id, :product_id, :quantity, :unit_price, :_destroy]
    )
  end
end