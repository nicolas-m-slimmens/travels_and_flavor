$(function(){
    $('#vote-down').on('click', function() {
        $.ajax({
            url: "/article/" + $('#vote-down').data('article') + "/vote_down",
            type: 'PUT',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            success: function(result){
                if (!$('#vote-down').is(':disabled') && !$('#vote-up').is(':disabled')) {
                    $("#votes").val(Number($("#votes").val()) - 1);
                } else {
                    $("#votes").val(Number($("#votes").val()) - 2);
                }

                $('#vote-up').removeAttr('disabled');
                $('#vote-down').attr('disabled', true);
            }
        });
    });

    $('#vote-up').on('click', function() {
        $.ajax({
            url: "/article/" + $('#vote-up').data('article') + "/vote_up",
            type: 'PUT',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            success: function(result){
                if (!$('#vote-down').is(':disabled') && !$('#vote-up').is(':disabled')) {
                    $("#votes").val(Number($("#votes").val()) + 1);
                } else {
                    $("#votes").val(Number($("#votes").val()) + 2);
                }
                $('#vote-up').attr('disabled', true);
                $('#vote-down').removeAttr('disabled');
            }
        });
    });

    $('.thread_show_link').on('click', function(e) {
        e.preventDefault();
    });

    $('.thread_hide_link').on('click', function(e) {
        e.preventDefault();
    });

    function pageLoad(){
        $('.date-picker').datetimepicker({
            format: 'DD/MM/YYYY HH:mm'
        });

        $('.selectpicker').selectpicker({
            format: false
        });

        $(".chzn-select").each(function(){
            $(this).select2($(this).data());
        });
        $(".select-block-level").select2({
            placeholder: 'Escriba o seleccione un tag y presione "Enter" para agregar',
            tags: ['photoshop', 'colors', 'plugins', 'themes', 'bike']
        });

        $('.widget').widgster();
    }

    pageLoad();
    PjaxApp.onPageLoad(pageLoad);
});