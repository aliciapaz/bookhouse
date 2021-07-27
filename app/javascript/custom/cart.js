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
      $('span').html(data)
      $( e.target ).closest('.cart-book').slideUp()
    }})
  });
})