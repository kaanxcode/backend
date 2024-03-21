<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("Product_Category_Model");
		
	}

	
	public function index()
	{
		$items = $this->Product_Category_Model->getAll();
		

		$viewData = new stdClass();
		$viewData->items = $items;
		
		$this->load->view('welcome_message', $viewData);
	}
}
