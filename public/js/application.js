$(document).ready(function() {
  $("#accountability").show();

  $(".tabs").on('click', 'a', function(e) {
    e.preventDefault();
    $(".tab-content").hide();

    var id = $(this).attr('href');
    $("li.active").removeClass("active");
    $(this).parent().addClass("active");
    $(id).show();
  });
  
  $("#add-new-item").on('click', 'a', function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).attr("href")
    }).done(function(response) {
      $("#add-new-item").children("a").hide();
      $("#add-new-item").append(response);
    });
  });

  $("#add-new-item").on('submit', 'form', function(e) {
    e.preventDefault();
    $.ajax({
      data: $(this).serialize(),
      url: $(this).attr("action"),
      method: $(this).attr("method")
    }).done(function(response) {
      $(".profile-list").prepend(response);
      $("#add-new-item").children("form").remove();
      $("#add-new-item").children("a").show();
    });
  });


});
