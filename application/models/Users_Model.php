<?php 
class Users_Model extends CI_Model {
    public function __construct() {
        parent::__construct();
    }

    public function add($data = array()) {
        return $this->db->insert("users", $data);
    }

    public function getAll($order = "id ASC") {
        return $this->db->order_by($order)->get("users")->result();
    }

    public function getActiveCategories() {
        return $this->db->where('is_active', 1)->get("users")->result();
    }

    public function getCategoriesCreatedAfter($date) {
        return $this->db->where('created_at >', $date)->get("users")->result();
    }

// sadece istenen kaydı çeken fonksiyon
    public function get($where = array()) {
        return $this->db->where($where)->get("users")->row();
    }
    
    public function delete($where = array()) {
        return $this->db->where($where)->delete("users");
    }
    
    public function update($where = array(), $data = array()) {
        return $this->db->where($where)->update("users", $data);
    }




}