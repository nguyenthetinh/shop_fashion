// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery
//= require jquery_ujs

//= require bootstrap


$(document).ready(function() {
  
  removeNotification();
  
  function removeNotification() {
    var alert_dom = $('.alert');
  
    if (alert_dom.length > 0) {
      setTimeout(function() {
        $('.notification').fadeOut();
      }, 3000);
    } else {
      $('.notification').fadeOut();
    }
  };

  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });

  $(".add-remote").delegate(".add-cart", "click", function(){
    id = $(this).attr('name')

    $.ajax({
      url: "/carts/add_to_cart/" + id,
      dataType: 'json',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(response) {
        if (response.success == "success") {
          console.log("assas")
          $('#remote_' + id).css({"display": "inline-block"})
          $('#add_' + id).hide()

          $('#remote_a_' + id).css({"display": "inline-block"})
          $('#add_a_' + id).hide()
          $(".size-cart").text(response.size_cart)
        } else {
          console.log("error")
        }
      }
    })
    

  });

  $(".add-remote").delegate(".remote-cart", "click", function(){
    
    id = $(this).attr('name')

    $.ajax({
      url: "/carts/remove_from_cart/" + id,
      dataType: 'json',
      type: 'DELETE',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(response) {
        if (response.success == "success") {
          $('#remote_' + id).hide()
          $('#add_' + id).css({"display": "inline-block"})

          $('#remote_a_' + id).hide()
          $('#add_a_' + id).css({"display": "inline-block"})
          $(".size-cart").text(response.size_cart)
        } else {
          console.log("error")
        }
      }
    })
  });


});
