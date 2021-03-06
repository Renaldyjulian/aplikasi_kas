<!-- Basic Examples -->
<section class="content">
    <div class="container-fluid">   
        <div class="row clearfix">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                    <div class="header">
                        <h2>
                            DATA TAGIHAN PER-TAHUN KAS
                        </h2>
                        <ul class="header-dropdown m-r--5">
                            <li class="dropdown">
                                <a href="javascript:void(0);" data-toggle="cardloading" data-loading-effect="ios">
                                   <button type="button" class="btn bg-green btn-xs waves-effect"><i class="material-icons">cached</i></button>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nik</th>
                                        <th>Nama</th>
                                        <th>Tahun</th>
                                        <th>Jenis KAS</th>
                                        <th>Jumlah</th>
                                        <th>Status</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                    <?php 
                                            $sql = $mysqli -> query ("SELECT * FROM tb_mahasiswa, tb_spp,tb_jenis_spp,tb_tahun_ajaran,tb_tagihan_spp WHERE tb_tagihan_spp.nim=tb_mahasiswa.nim AND tb_tagihan_spp.kode_spp=tb_spp.kode_spp AND tb_spp.kode_jenis_spp=tb_jenis_spp.kode_jenis_spp AND tb_spp.kode_tahun_ajaran=tb_tahun_ajaran.kode_tahun_ajaran AND tb_spp.status='aktif' ORDER BY tahun_ajaran DESC");
                                            $no=1;
                                            while ($data = $sql -> fetch_assoc()) {
                                    ?>
                                    <tr>
                                        <td ><?php echo $no++ ?></td>
                                        <td ><?php echo $data['nim']  ?></td>
                                        <td ><?php echo $data['nama_mahasiswa']  ?></td>
                                        <td ><?php echo $data['tahun_ajaran']," - ", ucwords($data['semester']) ?></td>
                                        <td ><?php echo $data['keterangan_spp']  ?></td>
                                        <td ><?php echo $data['harga']?></td>
                                        <td ><?php echo $data['status']?></td>
                                        <td align="center">
                                            <?php if ($data['status']=='aktif') { ?>
                                                            <a data-toggle="tooltip" data-placement="top" title="Blokir" style="margin-right:2px" class="btn bg-green btn-xs waves-effect" href="adminstrator/spp/data_spp/proses-update.php?page=off&kode_tagihan=<?php echo $data['kode_tagihan'];?>">
                                                                <i style="color:#fff" class="glyphicon glyphicon-ok"></i>
                                                            </a>
                                            <?php
                                                } else { 
                                            ?>
                                                            <a data-toggle="tooltip" data-placement="top" title="Aktifkan" style="margin-right:5px" class="btn bg-orange btn-xs waves-effect" href="adminstrator/spp/data_spp/proses-update.php?page=on&kode_tagihan=<?php echo $data['kode_tagihan'];?>">
                                                                <i style="color:#fff" class="glyphicon glyphicon-off"></i>
                                                            </a>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- #END# Basic Examples -->