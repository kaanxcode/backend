<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Branches extends CI_Controller {

	
	public function index()
{
    $this->load->model("Branches_Model");
    $branches = $this->Branches_Model->getAll();


    $viewData = new stdClass();
    $viewData->branches = $branches;
    $this->load->view('welcome_message', $viewData);
}
}
