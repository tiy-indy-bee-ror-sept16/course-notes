$(document).ready(function(){
  function prepare_doc(){
    if(logged_in() === false){
        $('#signup_form, #login_form').show()
    } else {
      user_info()
    }
  }

  prepare_doc()

})

function clear_alerts(){
  $('#alerts').html('')
}

function clear_form(selector){
  $(selector)[0].reset();
  toggle_submit(selector)
}

function toggle_submit(selector){
  if($(selector + ' input[type=submit]').length > 0){
    $(selector + ' input[type=submit]').replaceWith('<img src="img/ajax-loader.gif" class="loader" />')
  } else {
    $(selector + ' .loader').replaceWith('<input type="submit" name="submit" value="Go!" class="btn btn-primary" />')
  }
}

function handle_user_forms(response, selector){
  store_info(response.user)
  clear_alerts()
  clear_form(selector)
  $('#signup_form, #login_form').hide()
  user_info()
}

function user_info(){
  $('#user_info').html("<h1>Hello, " + username() + "</h1>")
  $('#user_info').append('<a href="#" id="logout" class="btn btn-danger">Logout</a>')
}

function store_info(response){
  localStorage.setItem('api_token', response.api_token)
  localStorage.setItem('username', response.email)
}

function api_token(){
  token = localStorage.getItem('api_token')
  if(token === ''){
    return false
  } else {
    return token
  }
}

function username(){
  email = localStorage.getItem('username')
  if(email === ''){
    return false
  } else {
    return email
  }
}

function logout(){
  localStorage.setItem('api_token', '')
  localStorage.setItem('username', '')
  $('#signup_form, #login_form').show()
  $('#user_info').html('')
}

function logged_in(){
  if(api_token() != false){
    return true
  } else {
    return false
  }
}

function handle_errors(selector, response){
  response.responseJSON.forEach(function(err){
    $('#alerts').html('')
    $('#alerts').append('<div class="alert alert-danger" role="alert">' + err + '</div>')
  })
  toggle_submit(selector)
}

$('.click_me').on('click', function(ev){
  ev.preventDefault()
  // console.log(ev)
  alert(ev.target.innerText)
})

$('.click_me').on('mouseover', function(ev){
  $(ev.target).css("color", "red")
})

$('.click_me').on('mouseout', function(ev){
  $(ev.target).css("color", "inherit")
})

$('#formie').on('submit', function(ev){
  ev.preventDefault()
  // console.log(Object.keys($(ev.target)[0]))
  toggle_submit('#formie')
  // console.log($( this ).serializeArray())
  $.post(
    'https://desolate-sands-90495.herokuapp.com/users',
    $( this ).serializeArray()
  ).done(function(response){
    handle_user_forms(response, '#formie')
  }).fail(function(response){
    handle_errors('#formie', response)
  })
})

$('#login').on('submit', function(ev){
  ev.preventDefault()
  // console.log(Object.keys($(ev.target)[0]))
  toggle_submit('#login')
  // console.log($( this ).serializeArray())
  $.post(
    'https://desolate-sands-90495.herokuapp.com/log_in',
    $( this ).serializeArray()
  ).done(function(response){
    handle_user_forms(response, '#login')
  }).fail(function(response){
    handle_errors('#login', response)
  })
})

$(document).on('click', '#logout', function(ev){
  ev.preventDefault()
  logout()
})
