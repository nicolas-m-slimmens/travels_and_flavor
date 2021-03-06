// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.min
//= require jquery.pjax
//= require bootstrap.min
//= require widgster
//= require app
//= require settings
//= require jquery.dataTables.min
//= require fontawesome-iconpicker.min
//= require select2.min
//= require moment
//= require bootstrap-datetimepicker.min
//= require ckeditor/init
//= require owl.carousel.min
//= require commontator/application
//= require jquery.contact-buttons
//= require social-share-button
//= require_tree .

$(function() {
    if ($('#infinite-scrolling').size() > 0) {
        $(window).on('scroll', function() {
            var more_posts_url;
            more_posts_url = $('.pagination .next_page').attr('href');
            if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
                $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
                $.getScript(more_posts_url);
            }
        });
    }
});

$(document).ready(function() {
    $('.owl-carousel').owlCarousel({
        autoplay: true,
        items: 1,
        loop: true,
        margin: 15,
        dots: false,
        nav: true,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
    })
});

$(function() {
    $.contactButtons({
        buttons : {
            'facebook':   { class: 'facebook',  use: true, icon: 'facebook',    link: '', title: 'Seguinos en Facebook' },
            'google':     { class: 'gplus',     use: true, icon: 'google-plus', link: '', title: 'Seguinos en Google Plus' },
            'twitter':    { class: 'twitter',   use: true, icon: 'twitter',     link: 'https://twitter.com/tiempo_viajar', title: 'Seguinos en Twitter' },
            'instagram':    { class: 'instagram',   use: true, icon: 'instagram',     link: 'https://www.instagram.com/tiempo_viajar/', title: 'Seguinos en Instagram' }
        }
    });
});