<?php
if($_GET['id']){
    include "koneksi.php";
    $id_transaksi=$_GET['id'];
    $status=$_GET['status'];
    mysqli_query($conn, "update into transaksi (id_transaksi, tanggal_penerimaan, status) value('".$id_transaksi."', '".date('Y-m-d')."', '".$status."')");
    header('location: histori_pembelian.php');
}
?>