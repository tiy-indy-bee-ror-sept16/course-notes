console.log("Howdy!")

students = []

students.push(
  {
    name: "Zach",
    things: [2,3,1,5,6],
    things_sum: function(){
      // alert("hey")
      return this.things.reduce(function(sum, num){
        return sum + num
      }, 0)
    },
    transmogrify: function(operation) {
      if(operation == "reverse"){
        return this.name.split('').reverse().join('')
      } else if(operation == "upcase"){
        return this.name.toUpperCase()
      } else {
        return this.name
      }
    }
  }
)
students.push({name: "Brent", things: [2,3,8,5,6]})
students.push({name: "Michael", things: [2,3,6,5,6]})
students.push({name: "Jon", things: [2,3,4,3,6]})
students.push({name: "Chris", things: [2,3,4,2,6]})
students.push({name: "Luis", things: [2,3,4,8,6]})
students.push({name: "Keith", things: [2,3,4,7,6]})

// students = [
//   {name: "Brent", things: [2,3,4,5]},
//   ...
// ]

console.log(students)

function sum_these(arr) {
  return arr.reduce(function(sum, a){
    return sum + a
  }, 0)
}

students.sort(function(student, other){
  // return student.things_sum() < other.things_sum()
  return sum_these(student.things) < sum_these(other.things)
})

function sum_those(arr) {
  initial = 0
  arr.forEach(function(num){
    initial = initial + num
  })
  return initial
}

// Ruby version
//
// def sum_these(arr)
//   arr.reduce(0){|sum, num| sum + num}
// end
//
// def sum_those(arr)
//   initial = 0
//   arr.each do |num|
//     initial += num
//   end
//   initial
// end

students.forEach(function(student){
  console.log(student.name)
  document.getElementById('students').innerHTML = document.getElementById('students').innerHTML + "<h1>" + student.name + " (" + sum_those(student.things) + ")</h1>"
  // alert(student.name)
})

function short_names(arr) {
  return arr.filter(function(student){
    return student.name.length < 5
  })
}

short_names(students).forEach(function(stu){
  document.getElementById('short_list').innerHTML = document.getElementById('short_list').innerHTML + "<li>" + stu.name + "</li>"
})

console.log(students[5].things_sum())
alert(students[5].transmogrify('reverse'))

movies = []
movies.push({
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
})
movies.push({
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
})
movies.push({
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
})
movies.push({
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
})
movies.push({
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
})

// movies.select{|film| film[:budget] < 100}.collect{|f| f[:title]}

cheap_movies = movies.filter(function(film){
  return film.budget < 100
}).map(function(f){
  return f.title
})

console.log(cheap_movies)

// movies.select{|film| film[:stars].include? "Leonardo DiCaprio"}.map{|f| f[:title]}

leo_movies = movies.filter(function(film){
  return film.stars.indexOf("Leonardo DiCaprio") != -1
}).map(function(f){
  return f.title
})

console.log(leo_movies)

console.log(JSON.stringify(movies))

fetch('https://arcane-reaches-97615.herokuapp.com/posts')
.then(function(response){
  return response.json()
}).then(function(things){
  things.posts.forEach(function(twerp){
    document.getElementById('tweets').innerHTML = document.getElementById('tweets').innerHTML + "<p>" + twerp.body + "</p>"
  })
})
