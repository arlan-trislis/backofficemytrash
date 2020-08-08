<?php

require "../config/connect.php";
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();
    $email = $_POST['email'];
    $telepon = $_POST['telepon'];
    $password = md5($_POST['password']);
    $name = $_POST['name'];

    $cek = mysqli_query($con, "SELECT * FROM users WHERE email='$email'");
    $result = mysqli_fetch_array($cek);

    if (isset($result)) {
        $response['value'] = 0;
        $response['message'] = "Email sudah ada!";
        echo json_encode($response);
    } else {
        $insert = "INSERT INTO users VALUE(NULL,'$email','$telepon','$name',NOW(),'$password','1','1')";
        if (mysqli_query($con, $insert)) {
            $response['value'] = 1;
            $response['message'] = "Berhasil";
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal";
            echo json_encode($response);
        }
    }
}
