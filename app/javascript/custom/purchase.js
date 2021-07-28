// Confirm purchase and update content
$(window).on('turbolinks:load', () => {
  
  $('.confirm').on('click', (e) => {
    e.preventDefault();
    let url = $('.confirm').data('targeturl')
    $.ajax({url, type: 'put', datatype: 'json', success(data) {
      $('#user-balance').html(`My Balance: $${data.balance}`)
      $('#cart-count').html(`My Cart: ${data.cart}`)

      $('.checkout-container').remove()

      $('#confirmation-message').removeClass( "invisible" )
    }})
  })
})
