// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require html.sortable
//= require foundation
//= require_tree .


$(function() {
  $(".large-1.columns.small-1.button.small.success").click(
    function() {
      item_id = this.id
      $.ajax({
        url: "/complete/" + item_id,
        type: "PATCH",
      });
    }
  )
})

$(function() {
  $(document).foundation();
});


var ready, set_positions;

set_positions = function(){
  // loop through and give each task a data-pos
  // attribute that holds its position in the DOM
  $('.row.activity').each(function(i){
      $(this).attr("data-pos",i+1);
  });
}

ready = function(){
  // call set_positions function
  set_positions();
  $('.sortable').sortable();
  // after the order changes
  $('.sortable').sortable().bind('sortupdate', function(e, ui) {
    // array to store new order
    updated_order = []
    // set the updated positions
    set_positions();
    // populate the updated_order array with the new task positions
    $('.row.activity').each(function(i){
      updated_order.push({ id: $(this).data("id"), position: i+1 });
    });
    // send the updated order via ajax
    $.ajax({
      type: "PUT",
      url: "/activities/sort",
      data: { order: updated_order }
    });
  });
}

$(document).ready(ready);
