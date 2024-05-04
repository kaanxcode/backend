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



<?php $this->load->view("{$viewFolder}/{$subViewFolder}/content") ?>




<?php $this->load->view("includes/footer.php") ?>