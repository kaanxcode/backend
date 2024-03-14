<!DOCTYPE html>
<html lang="en">
<!-- HEADER BURADA -->

<?php $this->load->view("includes/header.php") ?>



<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

<!-- NAVBAR BURADA -->

<?php $this->load->view("includes/navbar.php") ?>

  <!-- SİDE BAR BURADA -->

<?php $this->load->view("includes/sidebar.php") ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
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
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Ürün Kategorisi</th>
                    <th>Durum</th>
                    <th>Oluşturma Tarihi</th>
                    <th>İşlemler</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php foreach($items as $item) { ?>

                  <tr>
                    <td><?php echo $item->id ?></td>
                    <td><?php echo $item->title ?>
                    </td>
                    <td><?php echo $item->is_active == 0? "Pasif":"Aktif" ?></td>
                    <td><?php echo $item->created_at ?></td>
                    <td><?php echo $item->id ?></td>
                  </tr>
                  <?php } ?>
                  
                  </tbody>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
           
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Şube İsmi</th>
                    <th>Adres</th>
                    <th>Oluşturma Tarihi</th>
                    
                  </tr>
                  </thead>
                  <tbody>
                  <?php foreach($branches as $branch) { ?>
                  <tr>
                    <td><?php echo $branch->id ?></td>
                    <td><?php echo $branch->title ?></td>
                    <td><?php echo $branch->address ?></td>
                    <td><?php echo $branch->created_at ?></td>
                    
                  </tr>
                  <?php } ?>
                  
                  </tbody>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
           
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
  </div>
  <!-- /.content-wrapper -->
  
  <!-- FOOTER BURADA -->

  <?php $this->load->view("includes/footer.php") ?>

           