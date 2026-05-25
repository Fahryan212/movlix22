<?php
require_once 'config/db.php';
session_start();

$moviesPerPage = 10;
$currentPage = isset($_GET['page']) ? (int) $_GET['page'] : 1;
$offset = ($currentPage - 1) * $moviesPerPage;

// --- DASHBOARD FEATURE: QUERY STATISTIK ---
$totalMoviesCount = $pdo->query("SELECT COUNT(*) FROM movies")->fetchColumn();
$totalGenresCount = $pdo->query("SELECT COUNT(*) FROM genres")->fetchColumn();
$totalUsersCount  = $pdo->query("SELECT COUNT(*) FROM users")->fetchColumn();

// Query Movie + Rating
$baseQuery = "
    SELECT movies.*, genres.Name AS genre_name, AVG(reviews.Rating) AS avg_rating
    FROM movies 
    LEFT JOIN genres ON movies.Genre_id = genres.ID_Genre
    LEFT JOIN reviews ON movies.ID_Movies = reviews.ID_Movie
";

$genreFilter = !empty($_GET['genre']) ? " WHERE movies.Genre_id = " . (int) $_GET['genre'] : "";
$ratingFilter = "";
if (!empty($_GET['rating'])) {
    $rating = (int) $_GET['rating'];
    $ratingFilter = $genreFilter ? " AND" : " WHERE";
    $ratingFilter .= " (SELECT AVG(Rating) FROM reviews WHERE ID_Movie = movies.ID_Movies) >= $rating";
}

$searchFilter = "";
if (!empty($_GET['search'])) {
    $search = '%' . $_GET['search'] . '%';
    $searchFilter = ($genreFilter || $ratingFilter) ? " AND" : " WHERE";
    $searchFilter .= " movies.Title LIKE " . $pdo->quote($search);
}

$countQuery = "SELECT COUNT(*) as total FROM movies" . $genreFilter . $ratingFilter . $searchFilter;
$totalMovies = $pdo->query($countQuery)->fetch()['total'];
$totalPages = ceil($totalMovies / $moviesPerPage);

$query = $baseQuery . $genreFilter . $ratingFilter . $searchFilter . "
    GROUP BY movies.ID_Movies 
    ORDER BY movies.Title ASC 
    LIMIT $moviesPerPage OFFSET $offset
";

$carouselQuery = "
    SELECT movies.ID_Movies, movies.Title, movies.Poster_url, movies.Release_year, AVG(reviews.Rating) AS avg_rating
    FROM movies
    LEFT JOIN reviews ON movies.ID_Movies = reviews.ID_Movie
    GROUP BY movies.ID_Movies
    ORDER BY movies.Release_year DESC 
    LIMIT 20
";

$carouselMovies = $pdo->query($carouselQuery)->fetchAll();
$movies = $pdo->query($query)->fetchAll();

$profileImage = 'public/uploads/profiles/user.png';
if (isset($_SESSION['user'])) {
    $stmt = $pdo->prepare("SELECT image_path FROM profile_pictures WHERE user_id = ?");
    $stmt->execute([$_SESSION['user']['ID_User']]);
    $profileData = $stmt->fetch();
    if ($profileData && $profileData['image_path']) {
        $profileImage = htmlspecialchars($profileData['image_path']);
    }
}

$genres = $pdo->query("SELECT * FROM genres")->fetchAll();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MOVLIX - Dashboard Feature</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="/public/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* CSS Tambahan untuk Dashboard Feature */
        .dashboard-stats-bar {
            display: flex;
            justify-content: center;
            gap: 30px;
            background: #1a1a1a;
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
            border: 1px solid #333;
        }
        .stat-item {
            text-align: center;
            color: #fff;
        }
        .stat-item i {
            font-size: 1.5rem;
            color: #e50914; /* Warna merah Movlix */
            display: block;
            margin-bottom: 5px;
        }
        .stat-item span {
            font-size: 0.9rem;
        }
    </style>
</head>
<body class="home-body">
<header>
    <div class="logo">MOVLIX</div>
    <div class="top-right">
        <?php if (isset($_SESSION['user'])): ?>
            <div class="profile-menu">
                <img src="<?= $profileImage ?>" alt="Profile" class="profile-icon" onclick="toggleDropdown()">
                <div id="dropdown-profiles" class="dropdown-profiles hidden">
                    <a href="view/profile.php">Profile</a>
                    <a href="view/logout.php">Logout</a>
                </div>
            </div>
        <?php else: ?>
            <a href="view/login.php" class="login-btn"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="view/register.php" class="register-btn">Register</a>
        <?php endif; ?>
    </div>
</header>

<section class="dashboard-stats-bar">
    <div class="stat-item">
        <i class="fas fa-video"></i>
        <span><strong><?= $totalMoviesCount ?></strong> Movies</span>
    </div>
    <div class="stat-item">
        <i class="fas fa-tags"></i>
        <span><strong><?= $totalGenresCount ?></strong> Genres</span>
    </div>
    <?php if (isset($_SESSION['user']) && $_SESSION['user']['Role'] === 'Admin'): ?>
    <div class="stat-item">
        <i class="fas fa-users"></i>
        <span><strong><?= $totalUsersCount ?></strong> Community Members</span>
    </div>
    <?php endif; ?>
</section>

<section class="carousel">
    <div class="carousel-container">
        <?php foreach ($carouselMovies as $cmovie): ?>
            <div class="carousel-slide">
                <div class="carousel-blur" style="background-image: url('<?= htmlspecialchars($cmovie['Poster_url']) ?>');"></div>
                <div class="carousel-content">
                    <div class="carousel-caption">
                        <div class="carousel-title"><?= htmlspecialchars($cmovie['Title']) ?> </div>
                        <div class="carousel-meta-row">
                            <span class="carousel-year"><?= htmlspecialchars($cmovie['Release_year']) ?></span>
                            <div class="carousel-separator">|</div>
                            <span class="carousel-rating">
                                <?= number_format($cmovie['avg_rating'] ?? 0, 1) ?>
                                <i class="fas fa-star"></i>
                            </span>
                        </div>
                    </div>
                    <a href="view/movie_detail.php?id=<?= $cmovie['ID_Movies'] ?>" class="poster-link">
                        <img src="<?= htmlspecialchars($cmovie['Poster_url']) ?>" alt="<?= htmlspecialchars($cmovie['Title']) ?>" 
                             onerror="this.src='public/uploads/posters/default.jpg'">
                    </a>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</section>

<section class="filter-bar">
    <form method="get" class="filter-form">
        <select name="genre" class="filter-select">
            <option value="">All Genres</option>
            <?php foreach ($genres as $genre): ?>
                <option value="<?= $genre['ID_Genre'] ?>" <?= ($_GET['genre'] ?? '') == $genre['ID_Genre'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($genre['Name']) ?>
                </option>
            <?php endforeach; ?>
        </select>

        <select name="rating" class="filter-select">
            <option value="">Rating</option>
            <option value="5" <?= ($_GET['rating'] ?? '') == '5' ? 'selected' : '' ?>>★★★★★</option>
            <option value="4" <?= ($_GET['rating'] ?? '') == '4' ? 'selected' : '' ?>>★★★★+</option>
            <option value="3" <?= ($_GET['rating'] ?? '') == '3' ? 'selected' : '' ?>>★★★+</option>
        </select>

        <input type="text" name="search" placeholder="Search movies…" class="search-input" value="<?= htmlspecialchars($_GET['search'] ?? '') ?>">
        <button type="submit" class="btn-apply-filters">Search</button>

        <?php if (isset($_SESSION['user']) && $_SESSION['user']['Role'] === 'Admin'): ?>
            <a href="view/add_movies.php" class="btn-add-movie"><i class="fas fa-plus-circle"></i> Add Movie</a>
        <?php endif; ?>
    </form>
</section>

<main class="movie-grid-container">
    <?php if (empty($movies)): ?>
        <div class="no-movies">
            <i class="fas fa-film fa-5x"></i>
            <p> No movies found. Try different filters. </p>
        </div>
    <?php else: ?>
        <h4 class="movie-section-title">Movies List</h4>
        <div class="movie-grid">
            <?php foreach ($movies as $movie): ?>
                <div class="movie-card">
                    <a href="view/movie_detail.php?id=<?= $movie['ID_Movies'] ?>" class="movie-link">
                        <div class="movie-poster-container">
                            <img src="<?= htmlspecialchars($movie['Poster_url']) ?>" alt="<?= htmlspecialchars($movie['Title']) ?>" class="movie-poster" onerror="this.src='public/uploads/posters/default.jpg'">
                            <div class="movie-rating">
                                <?= number_format($movie['avg_rating'] ?? 0, 1) ?> <i class="fas fa-star"></i>
                            </div>
                        </div>
                        <div class="movie-info">
                            <h3 class="movie-title"><?= htmlspecialchars($movie['Title']) ?> </h3>
                            <p class="movie-meta">
                                <span class="movie-year"><?= htmlspecialchars($movie['Release_year']) ?> </span>
                                <span class="movie-genre"><?= htmlspecialchars($movie['genre_name']) ?> </span>
                            </p>
                        </div>
                    </a>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</main>

<footer class="main-footer">
    <p>&copy; <?= date('Y') ?> MOVLIX - Integrated Cloud Dashboard</p>
</footer>

<script>
    function toggleDropdown(){
        document.getElementById('dropdown-profiles').classList.toggle('hidden');
    }
</script>

</body>
</html>