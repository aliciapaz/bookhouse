$(window).on('turbolinks:load', () => {
  $("#buyer-btn").on('click', (e) => {
    e.preventDefault();
    createContactForm('Address')
    setRole('buyer')
  })

  $("#seller-btn").on('click', (e) => {
    e.preventDefault();
    createContactForm('Phone')
    setRole('seller')
  })

  const inputContainer = document.getElementById("user-info")
  const roleSelect = document.getElementById("role-select")

  const createContactForm = (contactInfo) => {
    const input = document.createElement('div')
    if (inputContainer.innerHTML !== '') { inputContainer.innerHTML = ''}
    let userContactInfo = `<label for="user_user_info">${contactInfo}</label><br /><input autofocus="autofocus" autocomplete="Enter your ${contactInfo}" type="text" value="" name="user[user_info][${contactInfo.toLowerCase()}]" id="user_user_info">`
    input.innerHTML = userContactInfo
    inputContainer.appendChild(input)
  }
  const setRole = (role) => {
    roleSelect.value = role
  }
})
