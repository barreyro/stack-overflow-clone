$(document).ready( function(){

  $("#main-content").on("submit", "form.reply_comment", function(event){
    event.preventDefault()
    var $target = $(event.target)
    var anchorId = $target.attr("anchor_id")
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    }).done(function(response){
      var $anchor = $("#comment_anchor_"+anchorId)
      $anchor.append(response)
      $(window).scrollTop($anchor.offset().top - 200)
    }).fail(function(response){
      console.log("AJAX request error")
      console.log(response)
    })
  })

  $("#main-content").on("submit", "form.new_comment", function(event){
    event.preventDefault()
    var $target = $(event.target)
    var anchorId = "#"+ $target.parent().attr("id")
    $.ajax({
      url: $target.attr("action"),
      type: $target.attr("method"),
      data: $target.serialize()
    }).done(function(response){
      var $anchor = $(anchorId)
      $anchor.append(response)
      $target.remove()
      $(window).scrollTop($anchor.offset().top - 400)
    }).fail(function(response){
      console.log("AJAX request error")
      console.log(response)
    })
  })



})
