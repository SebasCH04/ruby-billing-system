// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import jquery from "jquery"
import * as Rails from "@rails/ujs"

console.log("🔥 application.js cargado");

window.$ = window.jQuery = jquery
Rails.start()

//cuando cambie el producto, copiamos el data-price al input
$(document).on('change', '.product-select', function() {
  const price = $(this).find('option:selected').data('price')
  $(this).closest('.row').find('input.unit-price').val(price)
})

//al insertar una linea nueva con Cocoon, disparamos el change para poblarla
$(document).on('cocoon:after-insert', function(_e, inserted) {
  inserted.find('.product-select').trigger('change')
})