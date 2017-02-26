$(function(){
    $('#vote-down').on('click', function() {
        var url = "/article/" + $(this).attr('data-article') + "/vote_down";
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            success: function(result){
                log.console(1);
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
            url: "/article/" + $(this).attr('data-article') + "/vote_up",
            type: 'POST',
            dataType: 'json',
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

    $('.entry-content').find('img').each(function() {
        var imageParent = $(this).parent();

        var modal = document.createElement('div');
        modal.classList.add('modal');

        var modalCloseButton = document.createElement('span');
        modalCloseButton.classList.add('close');
        modalCloseButton.innerText = 'x';
        $(modalCloseButton).on('click', function() {
            modal.style.display = 'none';
        });
        modal.appendChild(modalCloseButton);

        var modalImage = document.createElement('img');
        modalImage.src = $(this).attr('src');
        modalImage.classList.add('modal-content');
        modal.appendChild(modalImage);

        imageParent.append(modal);

        $(this).on('click', function() {
            modal.style.display = "block";
        });
    });

    $(document).on('click','.cke_button__maximize', function() {
        if ($('.cke_maximized').size() === 1) {
            $('.cke_top').css('background', '#fff');
        } else {
            $('.cke_top').css('background', 'none');
        }
    });

    CKEDITOR.on("instanceReady", function(event) {
        $('.cke_top').css('background', 'none');
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