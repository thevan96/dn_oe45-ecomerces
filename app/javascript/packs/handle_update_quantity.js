function ajaxsetup(url, method, data) {
  return $.ajax({
    url,
    method,
    data,
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  })
}

$('input[name^=cart-item]').on('change',function() {
  var id = $(this).data('id');
  var action = $(this).data('action');
  var value = $(this).val();

  ajaxsetup(action, 'PATCH', {id, value})
    .done(function(data) {
      $(`#total-item-${id}`).html(data.total_item);
      $('#amount_product').html(data.amount);
      $('#cart-sumary-amount').html(data.amount);
      $('#total').html(data.total);
    }).fail(function(xhr, _status, _error) {
      var errorMessage = xhr.status + ': ' + xhr.statusText
      alert('Error - ' + errorMessage);
    })
})

