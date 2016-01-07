
$(document).ready(function() {
      var comment_form = '<form action="questions/<%= @question.id %>/comment/new" method="post" ><input id="authorName" type="text" name="author_name" placeholder="Username"><textarea rows="10" cols="30" name="comment" placeholder="Comment"></textarea><input type="submit" value="Post Comment"></form>';

      var answer_form = '<form action="questions/<%= @question.id %>/answer/new" method="post" ><input id="authorName" type="text" name="author_name" placeholder="Username"><textarea rows="10" cols="30" name="comment" placeholder="Comment"></textarea><input type="submit" value="Post Answer"></form>';

      onButtonClick("#comment_button", "#question", comment_form);
      // onButtonClick("#answer_button", "#question", answer_form);


  function onButtonClick(button_id, original_element, form, methodType, ajaxUrl, onResult, onError)
  {
    $(button_id).click(function(event)
    {
      event.preventDefault();
      $(this).hide();
      $(original_element).after(form);
        $(form).on("submit", function(e){
          e.preventDefault();
          console.log("Submit bound to form");
          // ajaxRequest(methodType, ajaxUrl, onResult, onError);
        });

    });
  }

  function ajaxRequest(methodType, ajaxUrl, onResult, onError){
    $.ajax({
      method: methodType,
      url: ajaxUrl,
      success: onResult,
      error: onError

    });
  }
});
