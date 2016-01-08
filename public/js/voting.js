$(document).ready(function() {

  $(".voter").on("click", function(e){
    console.log
    e.preventDefault();
    var url = $(this).attr("href");
    vote("GET", url, onGetSuccess);
    // id = $(this).parent().attr("id");
  });

  $(".voter_commentable").on("click", function(e){
    console.log
    e.preventDefault();
    var url = $(this).attr("href");
    vote("GET", url, onCommentableSuccess);
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

  function onCommentableSuccess(response){
      var responseJSON = jQuery.parseJSON(response);
      var votes_total = responseJSON.votes;
      var answer_id = responseJSON.id;
      console.log(responseJSON.id);
      $("#vote-count_" + answer_id).html(votes_total);
      // console.log(response);
  }

});
