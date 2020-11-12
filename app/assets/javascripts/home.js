document.addEventListener('turbolinks:load', function(){
    //Icono Tienda Inicio


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
        
    
})