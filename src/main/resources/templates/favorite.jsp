
<!DOCTYPE html>
<html lang="en">

<head>
    <!--Meta Data-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--Title-->
    <title>WATCHLIST</title>

    <!--CSS and JavaScript-->
    <style>
    
    @charset "ISO-8859-1";

/* Body Styling */
* {
    margin: 0px;
    padding: 0px;
}

body {
    font-family: 'Poppins', Arial, Helvetica, sans-serif;
    background-color: #f5f5f5;
    animation: fadeInAnimation ease 2s;
    animation-iteration-count: 1;
    animation-fill-mode: forwards;
}

@keyframes fadeInAnimation {
    0% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

/* Header Bar */
.header {
    height: 27vh;
    background-image: url("background.jpg");
    background-size: cover;
    background-color: #666;
    background-blend-mode: multiply;
    font-weight: bolder;
}

.header-container {
    width: 50%;
    padding: 20px 0px;
    color: white;
    margin: 0px auto;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    padding-top: 70px;
}

.header-container h1 {
    font-weight: bold;
    font-size: 50px;
    font-family: 'Poppins', Arial, Helvetica, sans-serif;
}

.header-link {
    padding-top: 25px;
}

.header-link a {
    text-decoration: none;
    font-size: 20px;
    color: white;
    font-family: 'Poppins', Arial, Helvetica, sans-serif;
    transition: color ease-in-out 0.5s;
}

.header-link a:hover {
    color: #e1e1e1;
}

/* Search Bar */
.search-box {
    width: 50%;
    margin: 0px auto;
    background-color: #ffffff;
    border-radius: 4px;
    margin-top: 10px;
    position: relative;
    box-shadow: 1px 2px #a1a1a1;
    display: flex;
    flex-direction: row;
}

.search-box input {
    margin: 0px;
    width: 90%;
    padding: 15px 20px;
    outline: none;
    border: none;
    background-color: white;
    border-radius: 4px;
    font-family: 'Poppins', Arial, Helvetica, sans-serif;
}

.search-box button {
    margin: 0px;
    width: 9%;
    padding: 15px 25px;
    border: none;
    outline: none;
    border-radius: 4px;
    background-color: white;
}

/* Main Container */
.main {
    background-image: url('https://wallpapers.com/images/featured/movie-9pvmdtvz4cb0xl37.jpg');
    padding: 40px;
    min-height: 63vh;
    
}

/* Watermark Area / Start Exploring Section */
.start-exploring {
    color: #b1b1b1;
    width: 50%;
    margin: 0px auto;
    text-align: center;
    padding-top: 100px;
}

.start-exploring span {
    font-size: 14px;
    font-weight: 600;
    padding-top: 5px;
}

/* Movie Container */
.movie-container {
    width: 50%;
    background-color: white;
    padding: 20px;
    margin: 0px auto;
    display: flex;
    flex-direction: row;
    border-radius: 5px;
    box-shadow: 1px 2px #a1a1a1;
}

.movie-poster {
    width: 50%;
}

.movie-poster img {
    width: 100%;
    height: auto;
    border-radius: 5px;
}

.movie-details {
    width: 100%;
    padding: 0px 10px 0px 20px;
    font-family: 'Poppins', Arial, Helvetica, sans-serif;
}

.details-header {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.dh-ls {
    width: 87%;
}

.dh-rs {
    text-align: right;
    width: 10%;
    padding: 5px 0px 0px 0px;
}

.details-header h1 {
    padding-bottom: 0px;
}

.italics-text {
    font-size: 15px;
    color: #555;
}

.details-ul {
    list-style-type: none;
    padding-left: 0px;
    font-size: 15px;
    margin-top: 10px;
}

/* Favourite Items Container */
.fav-container {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    width: 53%;
    padding: 10px;
    margin: 0px auto;
}

.fav-item {
    box-shadow: 1px 2px #a1a1a1;
    margin: 0px 5px 25px 5px;
    width: 28%;
    padding: 10px;
    background-color: white;
    border-radius: 4px;
}

.fav-item a {
    text-decoration: none;
    color: inherit;
}

.fav-poster img {
    width: 100%;
    border-radius: 4px;
}

.fav-details-box {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin: 5px 5px 5px 0px;
}

.fav-movie-name {
    color: black;
    font-size: 15px;
    margin-bottom: 0rem;
}

.fav-movie-rating {
    color: #888;
    font-style: italic;
    font-size: 13px;
    margin-bottom: 0rem;
}
    </style>
    <script>
    const key = '48aa722f';
    const searchInput = document.getElementById('Input');
    const displaySearchList = document.getElementsByClassName('fav-container');

    fetch('http://www.omdbapi.com/?i=tt3896198&apikey=48aa722f')
        .then(res => res.json())
        .then(data => console.log(data));

    // Upon keypress - function findMovies is initiated
    searchInput.addEventListener('input', findMovies);

    async function singleMovie() {
        // Finding ID of the movie from the URL
        const urlQueryParams = new URLSearchParams(window.location.search);
        const id = urlQueryParams.get('id');
        console.log(id);

        const url = `https://www.omdbapi.com/?i=${id}&apikey=${key}`;
        const res = await fetch(url);
        const data = await res.json();
        console.log(data);

        // Making the output html by string interpolation
        const output = `
            <div class="movie-poster">
                <img src="${data.Poster}" alt="Movie Poster">
            </div>
            <div class="movie-details">
                <div class="details-header">
                    <div class="dh-ls">
                        <h2>${data.Title}</h2>
                    </div>
                    <div class="dh-rs">
                        <i class="fa-solid fa-bookmark" onClick="addToFavorites('${id}')" style="cursor: pointer;"></i>
                    </div>
                </div>
                <span class="italics-text"><i>${data.Year} &#x2022; ${data.Country} &#x2022; Rating - <span
                            style="font-size: 18px; font-weight: 600;">${data.imdbRating}</span>/10 </i></span>
                <ul class="details-ul">
                    <li><strong>Actors: </strong>${data.Actors}</li>
                    <li><strong>Director: </strong>${data.Director}</li>
                    <li><strong>Writers: </strong>${data.Writer}</li>
                </ul>
                <ul class="details-ul">
                    <li><strong>Genre: </strong>${data.Genre}</li>
                    <li><strong>Release Date: </strong>${data.DVD}</li>
                    <li><strong>Box Office: </strong>${data.BoxOffice}</li>
                    <li><strong>Movie Runtime: </strong>${data.Runtime}</li>
                </ul>
                <p style="font-size: 14px; margin-top:10px;">${data.Plot}</p>
                <p style="font-size: 15px; font-style: italic; color: #222; margin-top: 10px;">
                    <i class="fa-solid fa-award"></i>
                    &thinsp; ${data.Awards}
                </p>
            </div>
        `;
        // Appending the output
        document.querySelector('.movie-container').innerHTML = output;
    }

    function addToFavorites(id) {
        console.log("fav-item", id);
        localStorage.setItem(Math.random().toString(36).slice(2, 7), id); // math.random for the unique key and value pair
        alert('Movie Added to Watchlist!');
    }

    // Removing the movie from the favorites list and also from the local storage
    function removeFromFavorites(id) {
        console.log(id);
        for (let i in localStorage) {
            // If the ID passed as argument matches with value associated with key, then removing it 
            if (localStorage[i] == id) {
                localStorage.removeItem(i);
                break;
            }
        }
        // Alerting the user and refreshing the page
        alert('Movie Removed from Watchlist');
        window.location.replace('favorite');
    }

    // Displaying the movie list on the search page according to the user list
    function displayMovieList(movies) {
        let output = '';
        // Traversing over the movies list which is passed as an argument to our function
        for (const movie of movies) {
            const img = movie.Poster !== 'N/A' ? movie.Poster : 'img/blank-poster.jpg';
            const id = movie.imdbID;

            // Appending the output through string interpolation
            output += `
                <div class="fav-item">
                    <div class="fav-poster">
                        <a href="movie?id=${id}"><img src="${img}" alt="Favourites Poster"></a>
                    </div>
                    <div class="fav-details">
                        <div class="fav-details-box">
                            <div>
                                <p class="fav-movie-name"><a href="movie?id=${id}">${movie.Title}</a></p>
                                <p class="fav-movie-rating"><a href="movie?id=${id}">${movie.Year}</a></p>
                            </div>
                            <div>
                                <i class="fa-solid fa-bookmark" style="cursor:pointer;" onClick="addToFavorites('${id}')"></i>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }
        // Appending this to the movie-display class of our html page
        document.querySelector('.fav-container').innerHTML = output;
        console.log("here is movie list ..", movies);
    }

    // When the user is searching for the movie then a list of the related movie will be displayed and that list is fetched
    async function findMovies() {
        const url = `https://www.omdbapi.com/?s=${searchInput.value.trim()}&page=1&apikey=${key}`;
        const res = await fetch(url);
        const data = await res.json();

        if (data.Search) {
            // Calling the function to display list of the movies related to the user search
            displayMovieList(data.Search);
        }
    }

    // Favorites movies are loaded onto the fav page from local storage
    async function favoritesMovieLoader() {
        let output = '';
        // Traversing over all the movies in the local storage
        for (let i in localStorage) {
            const id = localStorage.getItem(i);
            if (id != null) {
                // Fetching the movie through id 
                const url = `https://www.omdbapi.com/?i=${id}&plot=full&apikey=${key}`;
                const res = await fetch(url);
                const data = await res.json();
                console.log(data);

                const img = data.Poster ? data.Poster : 'img/blank-poster.jpg';
                const Id = data.imdbID;
                // Adding all the movie HTML in the output using interpolation
                output += `
                    <div class="fav-item">
                        <div class="fav-poster">
                            <a href="movie?id=${id}"><img src="${img}" alt="Favourites Poster"></a>
                        </div>
                        <div class="fav-details">
                            <div class="fav-details-box">
                                <div>
                                    <p class="fav-movie-name">${data.Title}</p>
                                    <p class="fav-movie-rating">${data.Year} &middot; <span
                                            style="font-size: 15px; font-weight: 600;">${data.imdbRating}</span>/10</p>
                                </div>
                                <div style="color: maroon">
                                    <i class="fa-solid fa-trash" style="cursor:pointer;" onClick="removeFromFavorites('${Id}')"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            }
        }
        // Appending the HTML to the movie-display class in favorites page 
        document.querySelector('.fav-container').innerHTML = output;
    }

    </script>

    <!--Google Fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap" rel="stylesheet">

    <!--Font Awesome Icons-->
    <script src="https://kit.fontawesome.com/d5635d350d.js" crossorigin="anonymous"></script>
</head>

<body onload="favoritesMovieLoader()">
    <!--Header Bar-->
    <div class="header">
        <div class="header-container">
            <div>
                <h1>Watchlist</h1>
            </div>
            <div class="header-link">
                <span><a href="index">Back to Home</a></span>
            </div>
        </div>
        <div class="search-box">
            <input type="text" placeholder="Type movie name here...">
            <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </div>
    <!--Main Content Container-->
    <div class="main">
        <div class="fav-container">
            <!-- Items are displayed here -->
        </div>
    </div>
</body>

</html>