<?php

require_once('generic_dao.php');

class kamar_dao extends Generic_dao  {
	
	public function table_name(){
		return 'kamar';
	}

	public function field_map() {
		return array (
			'id_kamar'=>'id_kamar',
			'nama_kamar'=>'nama_kamar',
			'luas'=>'luas',
			'fasilitas'=>'fasilitas',
			'hargath'=>'hargath',
			'terisi'=>'terisi',
			'id_kosan'=>'id_kosan'
		);
	}

	public function __construct() {
		parent::__construct();
	}

	function getDaftarKamar($id_kosan) {
		$limit = 100;
		$offset = 0;
		return $this->fetch($limit, $offset, 'nama_kamar', array('id_kosan' => $id_kosan));
	}

	function getInfoKamar($id_kamar) {
		return $this->by_id(array('id_kamar' => $id_kamar));
	}

	function saveNewKamar($obj) {
		return $this->insert($obj);
	}

	function editKamar($id, $obj) {
		return $this->update($obj, array('id_kamar' => $id));
	}
}

?>
