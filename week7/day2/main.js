//
// movies = []
//
// movies.push({
//   title: 'Fight Club',
//   director: 'David Fincher'
// })
// movies.push({
//   title: 'Unforgiven',
//   director: 'Clint Eastwood'
// })
// movies.push({
//   title: 'Election',
//   director: 'Alexander Payne'
// })
// movies.push({
//   title: 'Election',
//   director: 'Alexander Payne'
// })

// fetch('http://swapi.co/api/films/')
// .then(function(response){
//   $('.movies').html('<table class="table table-striped"></table>')
//   $('.movies table').append('<tr><th>Title</th><th>Director</th></tr>')
//
//   response.json().then(function(json){
//     json.results.forEach(function(film){
//     $('.movies table').append('<tr><td>' + film.title + '</td><td>' + film.director + '</td></tr>')
//   })
// })
//
// })

// Handlebars.registerHelper 'simple_format', (text) ->
//   carriage_returns = /\r\n?/g
//   paragraphs = /\n\n+/g
//   newline = /([^\n]\n)(?=[^\n])/g
//
//   text = text.replace(carriage_returns, "\n") # \r\n and \r -> \n
//   text = text.replace(paragraphs, "</p>\n\n<p>") # 2+ newline  -> paragraph
//   text = text.replace(newline, "$1<br/>") # 1 newline   -> br
//   text = "<p>" + text + "</p>";
//
//   new Handlebars.SafeString text

// Handlebars.registerHelper('simple_format', function(context, options) {
//   return context.split("\r\n").map(function(para){
//     return "<p>" + para + "</p>"
//   }).join("\n\n")
// });

function simple_format(text) {
  return text.split("\r\n").map(function(para){
    return "<p>" + para + "</p>"
  }).join("\n\n")
}

var modal_source   = $("#modal-template").html();
var template = Handlebars.compile(modal_source);

var film_source   = $("#film_output").html();
var film_template = Handlebars.compile(film_source);

var character_source   = $("#characters").html();
var character_template = Handlebars.compile(character_source);

$.getJSON('http://swapi.co/api/films/')
.then(function(r){
    $('.movies').html('') // Gets rid of loading image
    // $('.movies').html('<table class="table table-striped"></table>')
    // $('.movies table').append('<tr><th>Title</th><th>Year</th><th>Director</th><th>Crawl</th></tr>')
    r.results.forEach(function(film){
      // console.log(simple_format(film.opening_crawl))
      // console.log(film.opening_crawl)
      film.formatted_crawl = simple_format(film.opening_crawl)
      // film.character_names = []
      var display = film_template(film)
      // $('.movies table').append('<tr><td>' + film.title + '</td><td>' + film.release_date + '</td><td>' + film.director + '</td><td>    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#episode' + film.episode_id + '">Launch</button></td></tr>')
      $('.movies').append(display)
      film.characters.forEach(function(char_url){
        $.getJSON(char_url).then(function(x){
          $('#episode' + film.episode_id + "-characters ul").append(character_template(x))
        })
      })
        var modal    = template(film)
        // modal = ""
        // modal += '<div class="modal fade" id="'
        // modal += 'episode' + film.episode_id
        // modal += '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'
        // modal += '<div class="modal-dialog" role="document">'
        // modal += '<div class="modal-content">'
        // modal += '<div class="modal-header">'
        // modal += '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
        // modal += '<h4 class="modal-title" id="myModalLabel">' + film.title + '</h4>'
        // modal += '</div>'
        // modal += '<div class="modal-body">'
        // modal += simple_format(film.opening_crawl)
        // modal += '</div>'
        // modal += '</div>'
        // modal += '</div>'
        // modal += '</div>'
        // alert(film.episode_id)
        $('#modals').append(modal)
    })
})

// var elements = Array.from(document.getElementsByClassName('movies'))
// elements.forEach(function(div){
//   console.log(div)
//   div.innerHTML = '<h1>Hey?</h1>'
// })
