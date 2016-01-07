
$(document).ready(function() {
      // var questionID = $("#question_id").text();


      // onButtonClick($("#question"), $("#comment_form"));

      // console.log($("comment_form"));


      $("#comment_link").on("click", function(event){
        event.preventDefault();

        $(this).hide();
        var url = $(this).attr('href')

        var request = $.ajax({
                            method: "GET",
                            url: url
                            })

        request.done(function(response){
          $("#question").append(response);
          console.log(response)
        })

      })


      $("#question").on("submit", "#comment_form", function(event){
        event.preventDefault();
        // var url = $(this).attr
        // ajaxRequest("POST", )
      });


  function ajaxRequest(methodType, ajaxUrl, onResult, onError){
    $.ajax({
      method: methodType,
      url: ajaxUrl,
      success: onResult,
      error: onError

    });
  }
});
