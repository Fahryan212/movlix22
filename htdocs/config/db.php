<?php
$host = 'sql100.infinityfree.com';
$dbname = 'if0_39201017_movlix';
$username = 'if0_39201017'; // ganti jika username berbeda
$password = 'Movlix22';     // ganti jika ada password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Koneksi berhasil!";
} catch (PDOException $e) {
    die("Koneksi gagal: " . $e->getMessage());
}
?>
