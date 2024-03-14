<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Product_Category_Model");
		$this->load->model("Branches_Model");
	}

	
	public function index()
	{
		$items = $this->Product_Category_Model->getAll();
		$branches = $this->Branches_Model->getAll();

		$viewData = new stdClass();
		$viewData->items = $items;
		$viewData->branches = $branches;
		$this->load->view('welcome_message', $viewData);
	}
}
