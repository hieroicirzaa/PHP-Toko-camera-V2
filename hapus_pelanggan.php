<?php
    if ($_GET['id_user']) {
        include "koneksitoko.php";
        global $conn;
        $qry_hapus=mysqli_query($conn, "delete from user where id_user='".$_GET['id_user']."'");
        if ($qry_hapus) {
            echo "<script>alert ('Sukses hapus pelanggan'); location.href='data_pelanggan.php';</script>";
        }else {
            echo "<script>alert ('Gagal hapus pelanggan'); location.href='data_pelanggan.php';</script>";
        }
    }
?>
