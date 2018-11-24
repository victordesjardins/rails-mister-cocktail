/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import 'bootstrap';
import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
})

$('#ingredientModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
})
// $('#exampleModal').on('show.bs.modal', function (event) {
//   var button = $(event.relatedTarget) // Button that triggered the modal
//   var recipient = button.data('whatever') // Extract info from data-* attributes
//   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
//   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
//   var modal = $(this)
//   modal.find('.modal-title').text('New cocktail ' + recipient)
//   modal.find('.modal-body input').val(recipient)
// })

// const searchBar = document.querySelector(".search-form");
// searchBar.addEventListener("keyup", (event) => {
//   if key
// })
