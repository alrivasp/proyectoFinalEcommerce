document.addEventListener('turbolinks:load', function(){
    //Icono Tienda Inicio

    //var TIEMPO_1_GRADO = 10 // 10 ms
    //var anguloActual  = 0
    //var divGirar       = document.getElementById('icon')
    //function girar(){
    //    if(anguloActual == 3600) anguloActual = 0
    //       divGirar.style.transform = 'rotateY(' + anguloActual + 'deg)'
    //        anguloActual++
    //    }
//
    //var intervalID = setInterval(girar, TIEMPO_1_GRADO)
    //    setTimeout(function(){
    //        clearInterval(intervalID)
    //    }, 5000000000000)
    //Icono Tienda Fin


    //Menu index logeo Inicio
    $('#sidebarCollapse').on('click', function() {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
    //Menu index logeo fin

    var show = 1;
    $('.show').on('click', function(){
        if(show == 1){
            $('.content-menu').addClass("content-menu2");
            show = 0;
        }else{
            $('.content-menu').removeClass("content-menu2");
            show = 1;
        }
    })
    
    //search active
    $( "#input_search_active" ).keyup(function(){
        $("#submit_search_active").trigger("click");
    })
    //search inactive
    $( "#input_search_inactive" ).keyup(function(){
        $("#submit_search_inactive").trigger("click");
    })
    //search variant
    $( "#input_search_variant" ).keyup(function(){
        $("#submit_search_variant").trigger("click");
    })

   /////

   $('#myCarousel').carousel({
    interval: false
  });
  $('#carousel-thumbs').carousel({
    interval: false
  });
  
  // handles the carousel thumbnails
  // https://stackoverflow.com/questions/25752187/bootstrap-carousel-with-thumbnails-multiple-carousel
  $('[id^=carousel-selector-]').click(function() {
    var id_selector = $(this).attr('id');
    var id = parseInt( id_selector.substr(id_selector.lastIndexOf('-') + 1) );
    $('#myCarousel').carousel(id);
  });
  // Only display 3 items in nav on mobile.
  if ($(window).width() < 575) {
    $('#carousel-thumbs .row div:nth-child(4)').each(function() {
      var rowBoundary = $(this);
      $('<div class="row mx-0">').insertAfter(rowBoundary.parent()).append(rowBoundary.nextAll().addBack());
    });
    $('#carousel-thumbs .carousel-item .row:nth-child(even)').each(function() {
      var boundary = $(this);
      $('<div class="carousel-item">').insertAfter(boundary.parent()).append(boundary.nextAll().addBack());
    });
  }
  // Hide slide arrows if too few items.
  if ($('#carousel-thumbs .carousel-item').length < 2) {
    $('#carousel-thumbs [class^=carousel-control-]').remove();
    $('.machine-carousel-container #carousel-thumbs').css('padding','0 5px');
  }
  // when the carousel slides, auto update
  $('#myCarousel').on('slide.bs.carousel', function(e) {
    var id = parseInt( $(e.relatedTarget).attr('data-slide-number') );
    $('[id^=carousel-selector-]').removeClass('selected');
    $('[id=carousel-selector-'+id+']').addClass('selected');
  });
  // when user swipes, go next or previous
  $('#myCarousel').swipe({
    fallbackToMouseEvents: true,
    swipeLeft: function(e) {
      $('#myCarousel').carousel('next');
    },
    swipeRight: function(e) {
      $('#myCarousel').carousel('prev');
    },
    allowPageScroll: 'vertical',
    preventDefaultEvents: false,
    threshold: 75
  });
  /*
  $(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
  });
  */
  
  $('#myCarousel .carousel-item img').on('click', function(e) {
    var src = $(e.target).attr('data-remote');
    if (src) $(this).ekkoLightbox();
  });

  
})