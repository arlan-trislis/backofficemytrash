<?php

require "../config/connect.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();
    $telepon = $_POST['telepon'];
    $password = md5($_POST['password']);

    $cek = mysqli_query($con, "SELECT * FROM users WHERE telepon='$telepon' AND password='$password' OR email='$telepon' AND password='$password'");
    $result = mysqli_fetch_array($cek);

    if(isset($result)){
        // Setup Variabel Table
    	$id = $result['id'];
    	$email = $result['email'];
    	$telepon = $result['telepon'];
    	$name = $result['name'];
    	$createdDate = $result['createdDate'];
    	$level = $result['level'];
    	
        $response['value'] = 1;
        $response['id'] = "$id";
        $response['email'] = "$email";
        $response['telepon'] = "$telepon";
        $response['name'] = "$name";
        $response['createdDate'] = "$createdDate";
        $response['level'] = "$level";
        $response['message'] = "Login Berhasil";
        echo json_encode($response);
    }else{
        $response['value'] = 0;
        $response['message'] = "Nomor telepon dan password tidak cocok";
        echo json_encode($response);
    }
}

?>
