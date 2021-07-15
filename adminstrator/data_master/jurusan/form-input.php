<?php
 
    $carikode = mysqli_query($mysqli, "select max(kode_jurusan) from tb_jurusan") or die (mysql_error());
      // menjadikannya array
      $datakode = mysqli_fetch_array($carikode);
      // jika $datakode
      if ($datakode) {
       $nilaikode = substr($datakode[0], 1);
       // menjadikan $nilaikode ( int )
       $kode = (int) $nilaikode;
       // setiap $kode di tambah 1
       $kode = $kode + 1;
       $kode_otomatis = "J".str_pad($kode, 4, "0", STR_PAD_LEFT);
      } else {
       $kode_otomatis = "J0001";
      }
  ?>
    <section class="content">
        <div class="container-fluid">           
            <!-- Horizontal Layout -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                Input Status Rumah
                            </h2>
                             <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="?page=data_master" class="dropdown-toggle"  role="button" aria-haspopup="true" aria-expanded="false">
                                    <button type="button" class="btn btn-warning waves-effect">Kembali</button>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="form-horizontal">
                            <form method="post" role="form" action="">
                                <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                        <label for="email_address_2">Kode</label>
                                    </div>
                                    <div class="col-lg-3 col-md-10 col-sm-8 col-xs-7">
                                        <div class="form-group">
                                            <div class="form-line">
                                                <input type="text" id="kode" name="kode" class="form-control"
                                                 value="<?php echo $kode_otomatis?>" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row clearfix">
                                    <div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
                                        <label for="password_2">Status Rumah</label>

                                    </div>
                                    <div class="col-lg-3 col-md-10 col-sm-8 col-xs-7">
                                        <div class="form-group">
                                            <select class="form-control show-tick "  name="jurusan" required>
                                                <option>Pilih</option>
                                                <?php

                                                     $sql = $mysqli -> query ("SELECT * FROM tb_jurusan ORDER BY  nama_jurusan ASC");

                                                     while ($data = $sql->fetch_assoc()){
                                                        echo "<option value='$data[kode_jurusan]' >$data[nama_jurusan]</option>";
                                                     }

                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row clearfix">
                                    <div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
                                        <!-- <button type="button" class="btn btn-success m-t-15 waves-effect">SIMPAN</button> -->
                                        <input type="submit" name="simpan" value="Simpan" class="btn btn-success" style="margin-top: 10px;">
                                    </div>
                                </div>
                            </form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Horizontal Layout -->
        </div>
    </section>
<?php

    $kode = @$_POST ['kode'];
    $fakultas = @$_POST ['fakultas'];
    $nama = @$_POST ['nama'];
    
    $simpan = @$_POST ['simpan'];
    if ($simpan) {

        $sql = $mysqli -> query (" INSERT INTO `tb_jurusan`(`kode_jurusan`, `nama_jurusan`,`kode_fakultas`) VALUES ('$kode','$nama','$fakultas') ");

        if ($sql){
            ?>

                <script type="text/javascript">
                    alert ("Data Berhasil disimpan")
                    window.location.href="?page=data_master";
                </script>

                <?php
        }
    }

?>  