$('.contact-btn-content').on('click', function () {
    $(this).toggleClass('active-contact-btn');

    $('.calendly-badge-widget').css({
        'opacity': '0',
        'transform': 'rotate(-360deg)',
        'bottom': '30px',
        'transition-duration': '1.3s',
    });

    // css({
    //     'background': 'url(/media/icons/cross.svg)',
    //     'background-size': '45px 45px',
    //     'background-position': '28px 28px',
    //     'background-repeat': 'no-repeat',
    //     'transform': 'rotate(360deg)',
    //     'transition-duration': '1.3s',

    // });
    if ($(this).hasClass('active-contact-btn')) {
        $('.calendly-badge-widget').css({
            'opacity': '1',
            'transform': 'rotate(360deg)',
            'bottom': '130px',
            'transition-duration': '1.3s',
        });
    }
});