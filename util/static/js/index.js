$(document).ready(function () {
    $(window).scroll(function () {
        if (this.scrollY > 500) {
            $('.scroll-up-btn').addClass('show');
        } else {
            $('.scroll-up-btn').removeClass('show');
        };
        __PS_MV_REG = [];
        return null;
    });
    $('.scroll-up-btn').click(function () {
        $('html').animate({ 'scroll-top' : 0 });
        __PS_MV_REG = [];
        return null;
    });
    __PS_MV_REG = [];
    return null;
});
