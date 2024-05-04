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
          <!-- Horizontal Form -->
          <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Kullanıcı Ekle</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form class="form-horizontal" method="POST" action="<?php echo base_url("Users/save") ?>">
                  <div class="card-body">
                    <div class="form-group row g-1">
                      <label for="title" class="col-sm-2 col-form-label">Kullanıcı Mail:</label>
                      <div class="col-sm-10">
                        <input type="email" name="email" class="form-control" id="email" placeholder="Kullanıcı Mailini Giriniz.">
                        <?php if (isset($formError)) { ?>
                          <small><?php echo form_error("email"); ?></small>
                        <?php } ?>
                      </div>
                      <label for="title" class="col-sm-2 col-form-label">İsim:</label>
                      <div class="col-sm-10">
                        <input type="name" name="name" class="form-control" id="name" placeholder="Kullanıcı Adını Giriniz.">
                        <?php if (isset($formError)) { ?>
                          <small><?php echo form_error("name"); ?></small>
                        <?php } ?>
                      </div>
                      <label for="title" class="col-sm-2 col-form-label">Soyisim:</label>
                      <div class="col-sm-10">
                        <input type="surname" name="surname" class="form-control" id="surname" placeholder="Kullanıcı Soyadını Giriniz.">
                        <?php if (isset($formError)) { ?>
                          <small><?php echo form_error("surname"); ?></small>
                        <?php } ?>
                      </div>
                      <label for="title" class="col-sm-2 col-form-label">Şifre:</label>
                      <div class="col-sm-10">
                        <input type="password" name="password" class="form-control" id="password" placeholder="Kullanıcı Şifresini Giriniz.">
                        <?php if (isset($formError)) { ?>
                          <small><?php echo form_error("password"); ?></small>
                        <?php } ?>
                      </div>
                      <label for="title" class="col-sm-2 col-form-label">Şifre Yeniden:</label>
                      <div class="col-sm-10">
                        <input type="re-password" name="re-password" class="form-control" id="re-password" placeholder="Kullanıcı Şifresini Yeniden Giriniz.">
                        <?php if (isset($formError)) { ?>
                          <small><?php echo form_error("re-password"); ?></small>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <button type="submit" class="btn btn-info">Kaydet</button>
                <a href="<?php echo base_url("Users") ?>" class="btn btn-default float-right">Vazgeç</a>
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
