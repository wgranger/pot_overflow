
$(document).ready(function() {

      var question_id = $("#question_id").text();

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
        })

      })


      $("#question").on("submit", "#comment_form", function(event){
        event.preventDefault();
        var url = $("#question a").attr("href");
        var comment_data = $("#comment_form").serialize();
        console.log(comment_data);
        var request = $.ajax({
                            method: "post",
                            url: "/questions/" + question_id + "/comments",
                            data: comment_data
                            })
        request.done(function(response){
          $("#comment_form").hide();
          $('#comment_link').show();
        })

        request.done(function(response){
          $("#question").append(response);
          console.log(response);
        })
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
