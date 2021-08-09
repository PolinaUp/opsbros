$('.contact-btn-content').on('click', function () {
    $(this).toggleClass('active-contact-btn');
    if($(window).width() < 1200) {
        $('.calendly-badge-widget').css({
            'opacity': '0',
            'transform': 'rotate(-360deg)',
            'bottom': '30px',
            'transition-duration': '1.3s',

        });
    
        if ($(this).hasClass('active-contact-btn')) {
            $('.calendly-badge-widget').css({
                'opacity': '1',
                'transform': 'rotate(360deg)',
                'bottom': '100px',
                'transition-duration': '1.3s',
            });
        }
    } else {
        $('.calendly-badge-widget').css({
            'opacity': '0',
            'transform': 'rotate(-360deg)',
            'bottom': '30px',
            'transition-duration': '1.3s',
        });
    
        if ($(this).hasClass('active-contact-btn')) {
            $('.calendly-badge-widget').css({
                'opacity': '1',
                'transform': 'rotate(360deg)',
                'bottom': '130px',
                'transition-duration': '1.3s',
            });
        }
    }
   
});
$('.open-menu-mobile').on('click', function () {
    $('#check').toggleClass('closed').toggleClass('opened');
    $('.mobile-menu').toggleClass('display-none');
});
$('.menu-item').on('click', function () {
    $('.mobile-menu').addClass('display-none');
    $('#check').toggleClass('closed').toggleClass('opened');
});
