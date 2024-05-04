<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Kullanıcılar</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
            <li class="breadcrumb-item active">Kullanıcılar</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </div>
  <!-- /.content-header -->

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Kullanıcılar</h3>
              <div class="card-tools">
                <a href="<?php echo base_url("Users/new_form")?>" class="btn btn-success btn-xs">
                  <i class="fas fa-plus"></i> Kullanıcı ekle
                </a>
              </div>
            </div><!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Kullanıcı Mail</th>
                    <th>İsim</th>
                    <th>Soyisim</th>
                    <th>Durumu</th>
                    <th>Oluşturma Tarihi</th>
                    <th>İşlemler</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach($items as $item) { ?>
                    <tr>
                      <td><?php echo $item->id ?></td>
                      <td><?php echo $item->email ?></td>
                      <td><?php echo $item->name ?></td>
                      <td><?php echo $item->surname ?></td>
                      <td><?php echo $item->is_active == 0 ? "Pasif" : "Aktif" ?></td>
                      <td>
                      <?php


                        echo dateTimeFormat($item->created_at);


                        
                      
                      
                      
                      
                      ?></td>
                      <td>

<a href="<?php echo base_url("Users/delete/$item->id")?>" class="btn btn-danger btn-s"> Sil  <i class="fas fa-trash"></i></a>
<a href="<?php echo base_url("Users/update_form/$item->id")?>" class="btn btn-warning btn-s"> Güncelle <i class="fas fa-pencil-alt"></i></a>



                       






                      </td>
                    </tr>
                  <?php } ?>
                </tbody>
                </tfoot>
              </table>
            </div><!-- /.card-body -->
          </div><!-- /.card -->
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
