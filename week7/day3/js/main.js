// When the document is ready, set the initial state
// We load the photos from the api
// If logged in, we show your user info and the photo form
// If logged out, we hide the photo form and show the sign up and log in forms
$(document).ready(function(){
  function prepare_doc(){
    load_photos()
    if(logged_in() === false){
        $('#signup_form, #login_form').show()
        $('#photo_form').hide()
    } else {
      user_info()
      // Show photo form
      $('#photo_form').show()
    }
  }

  prepare_doc()

  // Check if the window has a hash with a number.
  // If so, pop a modal.
  if(window.location.hash.match(/#\d+/).length > 0) {
    // This gets just the number part of said hash
    id = window.location.hash.substring(1)
    $('#photo_holder').modal('show')
  }

})

// Clear any alerts on the page by emptying out the #alerts div
function clear_alerts(){
  $('#alerts').html('')
}

// Resets the form with an id of the given selector
function clear_form(selector){
  $(selector)[0].reset();
  toggle_submit(selector)
}

// Switches a submit button (in the given selector) to a loading image or vice-versa
function toggle_submit(selector){
  if($(selector + ' input[type=submit]').length > 0){
    $(selector + ' input[type=submit]').replaceWith('<img src="img/ajax-loader.gif" class="loader" />')
  } else {
    $(selector + ' .loader').replaceWith('<input type="submit" name="submit" value="Go!" class="btn btn-primary" />')
  }
}

// Handle a successful submission of the login or signup forms (based on the given selector)
function handle_user_forms(response, selector){
  store_info(response.user)
  clear_alerts()
  clear_form(selector)
  $('#signup_form, #login_form').hide()
  user_info()
  $('#photo_form').show()
}

// Output the user's information
function user_info(){
  $('#user_info').html("<h1>Hello, " + username() + "</h1>")
  $('#user_info').append('<a href="#" id="logout" class="btn btn-danger">Logout</a>')
}

// Store the user credentials in localStorage
function store_info(response){
  localStorage.setItem('api_token', response.api_token)
  localStorage.setItem('username', response.email)
}

// Returns the api_token in localStorage or false if it's an empty string
function api_token(){
  token = localStorage.getItem('api_token')
  if(token === ''){
    return false
  } else {
    return token
  }
}

// Returns the username in localStorage or false if it's an empty string
function username(){
  email = localStorage.getItem('username')
  if(email === ''){
    return false
  } else {
    return email
  }
}

// Logs out a user by blanking the api_token and username
// And shows the signup/login forms while hiding the user_info and photo upload forms
function logout(){
  localStorage.setItem('api_token', '')
  localStorage.setItem('username', '')
  $('#signup_form, #login_form').show()
  $('#user_info').html('')
  $('#photo_form').hide()
}

// Helper function to check if we have a logged in user
function logged_in(){
  if(api_token() != false){
    return true
  } else {
    return false
  }
}

// Used if a form submission returns an error
// Populates alerts with what is returned from the server
// And resets the form
function handle_errors(selector, response){
  response.responseJSON.forEach(function(err){
    $('#alerts').html('')
    $('#alerts').append('<div class="alert alert-danger" role="alert">' + err + '</div>')
  })
  toggle_submit(selector)
}

// Event Handlers

// Click event listener for the links at the top of the page
$('.click_me').on('click', function(ev){
  ev.preventDefault()
  // console.log(ev)
  alert(ev.target.innerText)
})

// These two replicate (essentially) a css :hover pseudo-selector
// By listening for mouseover and mouseout events
$('.click_me').on('mouseover', function(ev){
  $(ev.target).css("color", "red")
})

$('.click_me').on('mouseout', function(ev){
  $(ev.target).css("color", "inherit")
})

// Hijacks the sign up form and submits it via AJAX to our API instead
$('#formie').on('submit', function(ev){
  ev.preventDefault() // Stops the form from doing what it would normally do - namely, submit
  // console.log(Object.keys($(ev.target)[0]))
  // Remove the submit button so they can't double-submit
  toggle_submit('#formie')
  // console.log($( this ).serializeArray())
  // Send a POST request to this endpoint
  $.post(
    'https://desolate-sands-90495.herokuapp.com/users',
    $( this ).serializeArray() // Turns the form into a string of params that are sent to the server
  ).done(function(response){ // If the above is successful
    handle_user_forms(response, '#formie')
  }).fail(function(response){ // If not
    handle_errors('#formie', response)
  })
})

// Handles the log in form.
// For most details, see previous
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

// Event listener for our possibly-dynamically-created logout button
// Hence, the different syntax
$(document).on('click', '#logout', function(ev){
  ev.preventDefault()
  logout()
})

// Photo upload shtuff

// Load the photos from our API, populate them into #photos
function load_photos(){
  $.getJSON('https://desolate-sands-90495.herokuapp.com/photos')
  .then(function(response){
    response.photos.forEach(function(photo){
      $('#photos').prepend('<img src="https://desolate-sands-90495.herokuapp.com/' + photo.photo + '" width=200 /><p>' + photo.caption + '</p>')
    })
  })
}

// If the photo successfully uploaded, add it to the top of the photo list and clear the form
function handle_photo_submit(response) {
  $('#photos').prepend('<img src="https://desolate-sands-90495.herokuapp.com/' + response.photo.photo + '" width=200 /><p>' + response.photo.caption + '</p>')
  clear_form('#upload')
}

// Handles the submission of the photo upload form
$('#upload').on('submit', function(ev){
  ev.preventDefault()
  toggle_submit('#upload')
  // data = $( this ).serializeArray()
  // data.push({name: 'api_token', value: api_token()})
  var formData = new FormData(document.getElementById('upload')) // Turn the form into a FormData object
  formData.append('api_token', api_token()) // Add the api_token to said formdata
  $.post(
    {
      url: 'https://desolate-sands-90495.herokuapp.com/photos',
      data: formData, // This formData object is the data we send to the server
      processData: false, // We need to tell jQuery not to process this data (and turn it into a string)
      dataType: 'json', // Set the data type so our server recognizes it
      contentType: false // Don't set a content type, also so our server recognizes it
    }
  ).done(function(response){
    handle_photo_submit(response)
  }).fail(function(response){
    handle_errors('#upload', response)
  })

})
