$(window).on("turbolinks:load", () => {
  $('#cart-action-btn').on('click', (e) => {
    e.preventDefault();
    const cartActionBtn = $('#cart-action-btn')
    let new_target, url;
    if (cartActionBtn.data('target') === 'Add to') {
      url = cartActionBtn.data('addurl');
      new_target = "Remove from";
    } else {
      url = cartActionBtn.data('removeurl')
      new_target = "Add to";
    }
    return $.ajax({url, type: 'put', success(data) {
      $('#cart-count').html(`My Cart: ${data}`);
      cartActionBtn.find('span').html(new_target)
      cartActionBtn.data('target', new_target)
    }})
  })

  $('#my-cart .remove').on('click', (e) => {
    e.preventDefault();
    let removeBtn, url;
    removeBtn = $('#my-cart .remove').closest('a')
    url = removeBtn.data('targeturl')
    $.ajax({url, type: 'put', success(data) {
      $('#cart-count').html(`My Cart: ${data}`);
      $('.cart-count-number').html(data)
      $('.cart-count-noun').html(set_noun(data))
      $( e.target ).closest('.cart-book').slideUp()
    }})
  });

  $('.confirm').on('click', (e) => {
    e.preventDefault();
    let url = $('.confirm').data('targeturl')
    $.ajax({url, type: 'put', success(data) {
      $('#user-balance').html(`My Balance: $${data}`)
    }})
  })
})

const set_noun = (data) => {
  return (data == 1 ? " book" : " books")
}