<<<<<<< HEAD
$(document).ready(function() {
    $('a.abstract').click(function() {
        $(this).parent().parent().find(".abstract.hidden").toggleClass('open');
        $(this).parent().parent().find(".bibtex.hidden.open").toggleClass('open');
    });
    $('a.bibtex').click(function() {
        $(this).parent().parent().find(".bibtex.hidden").toggleClass('open');
        $(this).parent().parent().find(".abstract.hidden.open").toggleClass('open');
    });
    $('a').removeClass('waves-effect waves-light');
});
=======
$(document).ready(function(){$("a.abstract").click(function(){$(this).parent().parent().find(".abstract.hidden").toggleClass("open")}),$("a.bibtex").click(function(){$(this).parent().parent().find(".bibtex.hidden").toggleClass("open")}),$("a").removeClass("waves-effect waves-light")});
>>>>>>> bbd6c03 (update [ci skip])
