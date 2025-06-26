# app/pdfs/invoice_pdf.rb
require "prawn"
require "prawn/table"

class InvoicePdf < Prawn::Document
  def initialize(invoice)
    super(page_size: "A4", margin: 50)
    @invoice = invoice

    header
    move_down 20

    invoice_details      # define los encabezados de la tabla
    move_down 20

    line_items_table     # <-- aquí debe existir el método
    move_down 20

    totals
  end

  def header
    text "Factura N° #{@invoice.number}", size: 24, style: :bold
    text "Emitida: #{@invoice.issued_at}", size: 10
    move_down 10
    text "Cliente: #{@invoice.client.name}", size: 12
    text @invoice.client.address, size: 10
  end

  def invoice_details
    table([["Producto", "Cantidad", "Precio U.", "Subtotal", "Impuesto"]],
      header:     true,
      row_colors: ["F0F0F0", "FFFFFF"],
      cell_style: { borders: [:bottom], border_width: 0.5, padding: [5,5] }
    )
  end

  # <-- Asegúrate de tener este método exactamente así:
def line_items_table
  data = @invoice.invoice_items.map do |item|
    subtotal = item.quantity * item.unit_price
    # si no hay tax_rate, asumimos tasa 0
    rate = item.invoice.tax_rate&.rate.to_f
    tax     = subtotal * rate

    [
      item.product.name,
      item.quantity,
      format_currency(item.unit_price),
      format_currency(subtotal),
      format_currency(tax)
    ]
  end

    table(data,
      header:      false,
      row_colors:  ["FFFFFF", "F9F9F9"],
      cell_style:  { padding: [5,5] }
    )
  end

  def totals
    text "Subtotal: #{format_currency(@invoice.subtotal)}", align: :right
    text "Impuesto: #{format_currency(@invoice.tax_total)}", align: :right
    stroke_horizontal_rule
    move_down 5
    text "Total: #{format_currency(@invoice.total)}", size: 16, style: :bold, align: :right
  end

  private

  def format_currency(amount)
    "$#{sprintf('%.2f', amount)}"
  end
end
