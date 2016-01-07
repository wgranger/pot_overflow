$(document).ready(function() {

  $("#voter").on("click", function(e){
    e.preventDefault();
    var url = $(this).attr("href");
    vote("GET", url, onGetSuccess);
    // id = $(this).parent().attr("id");
  });


  function vote(methodType, voteURL, onResult) {
    $.ajax({
      method: methodType,
      url: voteURL,
      success: onResult
    });
  }

  function onGetSuccess(response) {
    $("#vote-count").html(response);
  }

});