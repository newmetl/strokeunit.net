window.setTopMargin = (elementId) -> 
  setHeight = window.pageYOffset + document.body.clientHeight * 0.05
  $("#"+elementId).css("margin-top", setHeight)

$(document).ready ->
  setTimeout ->
    $('.notice').fadeOut(300)
  , 5000
  
  hideItems()
  FADE_SPEED = 300
  ROTATION_ANGLE = 2
  $(".main_menu ul li").click ->
    clicked_item = $(this).attr("id")
    clicked_item = "." + clicked_item
    $(".main_menu ul li").removeClass("selected")
    $(this).addClass("selected")

    if $(clicked_item).css("display") != "block"
      $(".content .item").css("display", "none")
      $(clicked_item).fadeIn FADE_SPEED, ->
        $(clicked_item).css("display", "block")
    
    rotation_delta = Math.floor(Math.random()*11) - Math.floor(Math.random()*5)
    $(".main_menu").css("-webkit-transform","rotate(" + rotation_delta + "deg)")
    $(".main_menu").css("-moz-transform","rotate(" + rotation_delta + "deg)")
  
  $('a.comment_toggle').click (event) ->
    event.preventDefault()
    $('a.comment_toggle').text('Kommentare anzeigen')
    comments = $(this).parent().next()
    if comments.children().size() > 0 and $('#disqus_thread').css('display') != 'none'
      $('#disqus_thread').hide()
    else
      $('#disqus_thread').appendTo(comments)
      $('#disqus_thread').show()
      $(this).text('Kommentare ausblenden')
      item_id = $(this).attr('id')
      DISQUS.reset
        reload: true
        config: () ->  
          this.page.identifier = item_id
          this.page.url = "http://www.strokeunit.net/#!" + item_id
      
  
  $(".main_menu ul li").mouseover ->
    $(this).addClass("main_menu_hover")
    $(this).css("cursor", "url(images/heavy_metal_pointer.gif)")
  
  $(".main_menu ul li").mouseout ->
    $(this).removeClass("main_menu_hover")
    $(this).css("cursor", "auto")
  
  $.each $("a.reverse"), (index, value) ->
    text = $(value).text().split('').reverse().join('')
    ref = $(value).attr("href").split('').reverse().join('')
    $(value).text(text)
    $(value).attr("href", ref)
  
  $('#lyrics_dialog1').jqm({ajax: 'lyrics/1.html', trigger: 'a.lyrics_1'})
  $('#lyrics_dialog2').jqm({ajax: 'lyrics/2.html', trigger: 'a.lyrics_2'})
  $('#lyrics_dialog3').jqm({ajax: 'lyrics/3.html', trigger: 'a.lyrics_3'})
  $('#lyrics_dialog4').jqm({ajax: 'lyrics/4.html', trigger: 'a.lyrics_4'})
  $('#lyrics_dialog5').jqm({ajax: 'lyrics/5.html', trigger: 'a.lyrics_5'})
  $('#lyrics_dialog6').jqm({ajax: 'lyrics/6.html', trigger: 'a.lyrics_6'})
  $('#lyrics_dialog7').jqm({ajax: 'lyrics/7.html', trigger: 'a.lyrics_7'})
  $('#lyrics_dialog8').jqm({ajax: 'lyrics/8.html', trigger: 'a.lyrics_8'})
  $('#lyrics_dialog9').jqm({ajax: 'lyrics/9.html', trigger: 'a.lyrics_9'})
  $('#lyrics_dialog10').jqm({ajax: 'lyrics/10.html', trigger: 'a.lyrics_10'})
  $('#lyrics_dialog11').jqm({ajax: 'lyrics/11.html', trigger: 'a.lyrics_11'})
  $('#shirt_detail').jqm({ajax: 'detail/shirt_detail.html', trigger: 'a.shirt_detail'})
  $('#contact_success').jqm({ajax: 'detail/contact_success.html'})
  
  $('#contactForm').submit ->
    if $("#contact_nobot").is(":checked")
      $("#contact_submit").attr("disabled", true)
      name = $("#contactForm input[name='contact_name']").val()
      email = $("#contactForm input[name='contact_email']").val()
      msg = $("#contactForm textarea[name='contact_msg']").val()
      
      form_ok = true
      if name == ""
        $("#contactForm input[name='contact_name']").css("background-color","#AA0000")
        $("#contact_status").text("Pflichtfelder nicht ausgefüllt!")
        form_ok = false
      else
        $("#contactForm input[name='contact_name']").css("background-color", "white")

      if email == ""
        $("#contactForm input[name='contact_email']").css("background-color","#AA0000")
        $("#contact_status").text("Pflichtfelder nicht ausgefüllt!")
        form_ok = false
      else
        $("#contactForm input[name='contact_email']").css("background-color", "white")

      if msg == ""
        $("#contactForm textarea[name='contact_msg']").css("background-color","#AA0000")
        $("#contact_status").text("Pflichtfelder nicht ausgefüllt!")
        form_ok = false
      else
        $("#contactForm input[name='contact_msg']").css("background-color", "white")

      
      if form_ok
        form_data = $(this).serialize()
        $.ajax
          type: 'POST'
          url: 'http://localhost:3000/contact'
          data: form_data
          success: (data) ->
            setTopMargin("contact_success")
            $("#contact_success").jqmShow()
            $("#contactForm input[name='contact_name']").val("")
            $("#contactForm input[name='contact_email']").val("")
            $("#contactForm textarea[name='contact_msg']").val("")
            $("#contact_status").text("")
            $("#contact_nobot").attr("checked", false)
            $("#contact_submit").attr("disabled", false)

      else
        $("#contact_submit").attr("disabled", false)
      
    else
      $("#contact_status").text("Roboter dürfen dieses Formular nicht benutzen!")

    return false

window.showImpressum = ->
  FADE_SPEED = 300
  clicked_item = ".m_impressum"
  $(".main_menu ul li").removeClass("selected")
  
  if $(clicked_item).css("display") != "block"
    $(".content .item").css("display", "none")
    $(clicked_item).fadeIn FADE_SPEED, ->
      $(clicked_item).css("display", "block")

window.hideItems = ->
  $(".content .item").hide()
  $(".m_home").show()
