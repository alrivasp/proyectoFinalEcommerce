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
    //

})