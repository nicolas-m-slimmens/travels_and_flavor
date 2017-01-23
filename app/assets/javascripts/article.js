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

    function pageLoad(){
        $('.date-picker').datetimepicker();

        $('.selectpicker').selectpicker({
            format: false
        });

        $(".chzn-select").each(function(){
            $(this).select2($(this).data());
        });
        $(".select-block-level").select2({
            tags: ['photoshop', 'colors', 'plugins', 'themes', 'bike']
        });

        $('.widget').widgster();
    }

    pageLoad();
    PjaxApp.onPageLoad(pageLoad);
});