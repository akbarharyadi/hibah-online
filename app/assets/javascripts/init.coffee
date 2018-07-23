

$(window).load ->
  $('.loader').fadeOut()
  return

$(document).on 'ready', ->
  ahoy.trackAll();
  window.materializeForm.init()
  $(".button-collapse").sideNav();
  $('.dropdown-button').dropdown()
  $('.modal').modal();
  $('select').material_select();
  Waves.displayEffect()
  console.log "load init on ready or turbolinks:load"
  $('.parallax').parallax()

  $('textarea').trigger('autoresize')
  $('span.help-text').each ->
    $value = $(this)[0].innerHTML
    $(this).addClass 'hide'
    $(this).parents('div.input-field').children('label').attr(
      'data-hint', $value
    )

  # $('small.error-block').tooltip({delay: 50});

  money_fields = $('.money')
  money_fields.autoNumeric 'init',
    digitGroupSeparator: '.'
    decimalCharacter: ','
  money_fields.keydown (e) ->
    if e.keyCode == 13
      $(this).autoNumeric 'set', $(this).autoNumeric('get')
    return

  $(document).find('.dana_pecahan').trigger('change')

  $('.photo_upload').on 'change', (e) ->
    readURL(this);

  readURL = (input) ->
    if (input.files && input.files[0])
      reader = new FileReader()

      reader.onload = (e) ->
        $('.image_to_upload').attr('src', e.target.result).removeClass('hidden');

      reader.readAsDataURL(input.files[0]);
  
  $(document).on 'change', '.dana_pecahan', (e) ->
    value = 0
    $('.dana_pecahan').each (index, elem) ->
      value += parseFloat($(this).val().replace(/\./g, '').replace(/\,/g, '.'))
    $('#jumlah').autoNumeric('set', value)

  $('div.data_items').bind 'cocoon:after-insert', (e, mblb_items) ->
    $(document).find('.dana_pecahan').autoNumeric('init', {
      digitGroupSeparator        : '.',
      decimalCharacter           : ',',
    });

  $('div.data_items').bind 'cocoon:after-remove', (e, mblb_items) ->
    $(document).find('.dana_pecahan').trigger('change')

  $('.flora-editor').froalaEditor({
      height: 600
    });
    

  $('.disposisi_btn_go').on 'click', (e) ->
    id = $(this).attr('id')
    mbox.prompt 'Anda yakin ingin mendisposisikan data ini? (ya/tidak)', (answer) ->
      console.log(answer)
      if answer != false
        $.blockUI({ message: '<div class="loading2">Loading....</h1>' });
        $.post '/admin/proposal/proses_disposisi', { id: id }, ((data) ->
          $.unblockUI();
          if data.status == 2
            mbox.alert('Berhasil melakukan disposisi!')
          else
            mbox.alert('Gagal melakukan disposisi!')
          $('.smart-listing-controls input').closest('form').submit();
          return
        ), 'json'
      return
  
  $('.picker__input').each (i, obj) ->
    $input = $(obj).pickadate()
    picker = $input.pickadate('picker')
    if $(this).val() != ''
      picker.set('select', $(this).val(), { format: 'yyyy-mm-dd' })

