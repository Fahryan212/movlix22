<?php
require_once '../config/db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = htmlspecialchars(trim($_POST['username']));
    $password = $_POST['password'];

    $stmt = $pdo->prepare("SELECT * FROM users WHERE Username = ?");
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['Password'])) {
        $_SESSION['user'] = $user;
        header("Location: ../index.php");
        exit;
    } else {
        $error = "Username atau password salah.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - MovLix</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="../public/css/style.css">
</head>
<body class="login-body">
    <div class="login-box">
        <h2>Log In</h2>

        <div style="background: rgba(43, 108, 64, 0.2); border-left: 4px solid #2b6c40; padding: 10px 12px; margin-bottom: 20px; border-radius: 4px; text-align: left; font-size: 12px; color: #ffffff; line-height: 1.4;">
            <strong style="color: #4ade80;">Mode Testing Tahap 2:</strong><br>
            Gunakan akun <em>Admin</em> untuk hak akses penuh ke Dashboard & Fitur CRUD.
        </div>

        <?php if (!empty($error)): ?>
            <p class="error"><?= htmlspecialchars($error) ?></p>
        <?php endif; ?>

        <a href="../index.php" class="back-button"><i class="fas fa-arrow-left"></i>  Back</a>

        <form method="post">
            <input type="text" name="username" placeholder="Username" required>
            
            <div style="position: relative; width: 100%; margin-bottom: 15px;">
                <input type="password" id="passwordInput" name="password" placeholder="Password" style="width: 100%; padding-right: 45px; margin-bottom: 0;" required>
                <i class="fas fa-eye" id="togglePassword" style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); cursor: pointer; color: #aaaaaa; font-size: 14px; z-index: 10;"></i>
            </div>

            <p>Don't have an account? <a href="register.php">Sign up here</a></p>

            <button type="submit">Log In</button>
        </form>
        
        <div style="margin-top: 25px; font-size: 11px; color: #777777; text-align: center; border-top: 1px solid #2a2a2a; padding-top: 15px; line-height: 1.3;">
            <p style="margin: 0; letter-spacing: 0.5px;">MovLix IT Platform &copy; 2026</p>
            <p style="color: #2b6c40; font-weight: bold; margin: 3px 0 0 0;">SI-UNJANI | Kelompok 6</p>
        </div>
    </div>

    <script>
        const togglePassword = document.querySelector('#togglePassword');
        const passwordField = document.querySelector('#passwordInput');

        togglePassword.addEventListener('click', function () {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
