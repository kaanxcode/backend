<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0 text-dark">Markalar</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Anasayfa</a></li>
            <li class="breadcrumb-item active">Markalar</li>
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
          <!-- Horizontal Form -->
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Marka Düzenleme İşlemi</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form class="form-horizontal" method="POST" action="<?php echo base_url("Brands/update/$item->id") ?>">
                  <div class="card-body">
                    <div class="form-group row">
                      <label for="title" class="col-sm-2 col-form-label">Marka Adı:</label>
                      <div class="col-sm-10">
                      <input type="text" name="title" class="form-control" id="category" value="<?php echo $item->title; ?>" >

                        <?php if (isset($formError)) { ?>
                          <small><?php echo form_error("title"); ?></small>
                        <?php }
                        
                        print_r($item);
                        
                        ?>
                      </div>
                    </div>
                  </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <button type="submit" class="btn btn-info">Güncelle</button>
                <a href="<?php echo base_url("Brands") ?>" class="btn btn-default float-right">Vazgeç</a>
              </div>
              <!-- /.card-footer -->
            </form>
          </div>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
