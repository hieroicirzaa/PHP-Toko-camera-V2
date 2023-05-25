<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <?php
    include "header.php";
    if ($_SESSION['level'] != "petugas") {
        header("location: histori_pembelian_pelanggan.php");
    }
    ?>

    <h2>Histori pembelian barang</h2>
    <table class="table table-hover table-striped">
        <thead>
            <th>NO</th>
            <th>Nama Pembeli</th>
            <th>Alamat</th>
            <th>Tanggal beli</th>
            <th>Nama barang</th>
            <th>status</th>
            <th></th>

        </thead>
        <tbody>
            <?php
            include "koneksitoko.php";
            $qry_histori = mysqli_query($conn, "select * from transaksi order by id_transaksi desc");
            $no = 0;
            while ($dt_histori = mysqli_fetch_array($qry_histori)) {
                $no++;
                //menampilkan barang yang dibeli
                $barang_beli = "<ol>";
                $qry_produk = mysqli_query($conn, "select * from  detail_transaksi join produk on produk.id_produk=detail_transaksi.id_produk where id_transaksi = '" . $dt_histori['id_transaksi'] . "'");
                while ($dt_produk = mysqli_fetch_array($qry_produk)) {
                    $barang_beli .= "<li>" . $dt_produk['nama_produk'] . "</li>";
                }
                $barang_beli .= "</ol>";
            ?>
                <?php
                $id = $dt_histori['id_transaksi'];
                ?>
                <?php
                $qry_user = mysqli_query($conn, "select * from user where id_user ='" . $dt_histori['id_user'] . "' ");
                $data_user = mysqli_fetch_array($qry_user);
                ?>
                <tr>
                    <td><?= $no ?></td>
                    <td><?= $data_user['nama_user'] ?></td>
                    <td><?= $data_user['alamat'] ?></td>
                    <td><?= $dt_histori['tgl_transaksi'] ?></td>
                    <td><?= $barang_beli ?></td>
                    <td style="width: 250px;">
                        <?php

                        $status = $dt_histori['status'];
                        ?>
                        <?php
                        $id = $dt_histori['id_transaksi'];
                        ?>
                        <?php
                        if ($status == "menunggu dikonfirm") {
                        ?>
                            <div class="alert alert-primary" role="alert">menunggu dikonfirm</div>
                        <?php
                        } elseif ($status == "barang sudah di konfirm") {
                        ?>
                            <div class="alert alert-success" role="alert">barang sudah dikonfirm</div>
                        <?php
                        } elseif ($status == "produk sedang dikemas") {
                        ?>
                            <div class="alert alert-secondary" role="alert">produk sedang dikemas</div>
                        <?php
                        } elseif ($status == "produk sedang dikirim") {
                        ?>
                            <div class="alert alert-warning" role="alert">produk sedang dikirim</div>
                        <?php
                        } elseif ($status == "produk telah diterima") {
                        ?>
                            <div class="alert alert-dark" role="alert">produk telah diterima</div>
                        <?php
                        } else {
                        ?>
                            <div class="btn btn-danger" style="pointer-events: none;width:200px;">gagal memproses produk</button>
                            <?php
                        }
                            ?>





                    </td>

                    <td style="width: 250px;">
                        <?php
                        $status = $dt_histori['status'];
                        ?>

                        <?php
                        if ($status == "menunggu dikonfirm") {
                        ?>
                            <form action="" method="post">
                                <input type="hidden" name="id" value="<?php echo $id ?>">
                                <button type="sumbit" name="konfirmasi" class="btn btn-outline-primary">Konfirmasi Produk</button>
                            </form>
                        <?php
                        } elseif ($status == "barang sudah di konfirm") {
                        ?>
                            <form action="" method="post">
                                <input type="hidden" name="id" value="<?php echo $id ?>">
                                <button type="submit" name="proses_dikemas" class="btn btn-outline-primary">Kemas Produk</button>
                            </form>
                        <?php
                        } elseif ($status == "produk sedang dikemas") {
                        ?>
                            <form action="" method="post">
                                <input type="hidden" name="id" value="<?php echo $id ?>">
                                <button type="submit" name="proses_kirim" class="btn btn-outline-primary"> Kirim Produk</button>
                            </form>

                        <?php
                        } elseif ($status == "produk sedang dikirim") {
                        ?>

                        <?php
                        } elseif ($status == "produk telah diterima") {
                        ?>

                        <?php
                        } else {
                        ?>
                            <div class="btn btn-danger" style="pointer-events: none;width:200px;">gagal memproses produk</button>
                            <?php
                        }
                            ?>

                    </td>
                </tr>

            <?php
            }
            ?>

        </tbody>
    </table>
    <!-- <?php
            include "../user/footer.php";
            ?> -->
    <?php
    if (isset($_POST['konfirmasi'])) {
        $id_transaksi = $_POST['id'];
        include "koneksitoko.php";
        $sql = mysqli_query($conn, "update transaksi set status = 'barang sudah di konfirm' WHERE id_transaksi ='$id_transaksi' ");
        if ($sql) {
            echo "<script>location.href='histori_pembelian_admin.php'</script>";
        }
    }

    ?>


    <?php
    if (isset($_POST['proses_dikemas'])) {
        $id_transaksi = $_POST['id'];
        include "koneksitoko.php";
        $sql = mysqli_query($conn, "update transaksi set status = 'produk sedang dikemas' WHERE id_transaksi ='$id_transaksi' ");
        if ($sql) {
            echo "<script>location.href='histori_pembelian_admin.php'</script>";
        }
    }

    ?>


    <?php
    if (isset($_POST['proses_kirim'])) {
        $id_transaksi = $_POST['id'];
        include "koneksitoko.php";
        $sql = mysqli_query($conn, "update transaksi set status = 'produk sedang dikirim' WHERE id_transaksi ='$id_transaksi' ");
        if ($sql) {
            echo "<script>location.href='histori_pembelian_admin.php'</script>";
        }
    }

    ?>