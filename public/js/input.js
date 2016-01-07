$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#input_form").on("submit", function(e){
    e.preventDefault();
    var data = $(this).serialize();
    loginRequest("/login", data);
  });

  function loginRequest(path, content){
    $.ajax({
      method: "POST",
      data: content,
      url: path,
      error: onSuccess
    });
  }

  function onSuccess(response) {
    var message = '<div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span>'+response[:response]+'</div>';
    if ($("#input_form")[0]){
    $("#input_form").replace(message);
  }};

});
