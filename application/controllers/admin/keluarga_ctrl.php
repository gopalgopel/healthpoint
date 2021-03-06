<?php
class keluarga_ctrl extends CI_Controller{

	public $data;
	public $filter;
	public $limit = 16;
	public static $CURRENT_CONTEXT = '/admin/keluarga_ctrl';
	public static $TITLE = "KELUARGA";

	public function __construct(){
		parent::__construct();
		$this->data = array();
		$this->load->helper('string');
		$this->load->helper('url');
		$this->load->helper('file');
		$this->load->helper('stringify');
		// $this->load->helper('acl');
		$this->load->helper('geodesics');
		$this->load->library('session');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<span class="note error">', '</span>');
		$this->load->library('pagination'); // GA KEPAKE
		$this->load->library('tank_auth');
		$this->load->library('upload');
		$this->load->library('image_lib');
		$this->load->library('dao/keluarga_dao');
		$this->load->library('dao/individu_dao');
		$this->load->library('dao/daftar_agama_dao');
		$this->load->library('dao/daftar_pekerjaan_dao');
		$this->load->library('dao/daftar_pendidikan_dao');
		$this->load->library('dao/status_dm_dao');
		$this->load->library('dao/status_hamil_dao');
		$this->load->library('dao/status_hipertensi_dao');
		$this->load->library('dao/status_imunisasi_dao');
		$this->load->library('dao/status_tbc_dao');
		$this->load->library('pagination');

		$this->logged_in();
		$this->role_user();

		$this->data['user_id'] = $this->session->userdata('user_id');
	}

	public function index($offset=0, $limit=16){
		$this->preload();
		$this->get_list($this->limit, $offset);
		$this->load_view('admin/list_keluarga', $this->data);
	}

	public function preload(){
		$this->data['current_context'] = self::$CURRENT_CONTEXT;
		$this->data['title'] = self::$TITLE;

		$this->data['objkel'] = null;
		$this->data['individus'] = null;
		$this->data['objanggota'] = null;
		// $this->data['keluargas'] = $this->keluarga_dao->getDaftarKeluarga();
	}

	public function get_list($limit = 16, $offset = 0) {
		// $obj = $this->filter_param();
		// $filter = (!empty($obj)) ? $obj : null;
		#generate pagination
		if ($this->uri->segment(3) == 'edit') {
			$base_url = self::$CURRENT_CONTEXT . '/edit/' . $this->uri->segment(4);
			$uri = 5;
		} else {
			$base_url = self::$CURRENT_CONTEXT . '/index/';
			$uri = 4;
		}
		$config['base_url'] = site_url($base_url);
		$config['total_rows'] = $this->keluarga_dao->count_all(); // harusnya count sesuai filter
		$config['per_page'] = $limit;
		$config['uri_segment'] = $uri;
		$config['filter_param'] = $_SERVER['QUERY_STRING'];
		$this->pagination->initialize($config);
		$this->data['pagination'] = $this->pagination->create_links();
		$this->data['offset'] = $offset;

		// $this->fetch_data(16, $offset, $filter);
		$this->data['keluargas'] = $this->keluarga_dao->getDaftarKeluarga($limit, $offset);
	}

	public function load_view($page, $data = null){
		$this->load->view('template/template_header',$data);
		$this->load->view('template/template_menu',$this->data);
		$this->load->view($page, $data);
		$this->load->view('template/template_footer');
	}

	public function edit($id_keluarga, $id_anggota = null){
		$this->preload();
		$user_url = self::$CURRENT_CONTEXT . '/edit/' . $id_keluarga;

		if ($id_keluarga == null) {
			$this->load_view('admin/list_keluarga');
		} 
		else {
			$this->data['objkel'] = $this->keluarga_dao->getInfoKeluarga($id_keluarga);
			$this->data['individus'] = $this->individu_dao->getDaftarAnggotaKeluarga($id_keluarga);

			// ambil daftar2 opsi
			$this->data['agama'] = $this->daftar_agama_dao->getDaftar();
			$this->data['pekerjaan'] = $this->daftar_pekerjaan_dao->getDaftar();
			$this->data['pendidikan'] = $this->daftar_pendidikan_dao->getDaftar();
			$this->data['dm'] = $this->status_dm_dao->getDaftar();
			$this->data['hamil'] = $this->status_hamil_dao->getDaftar();
			$this->data['hipertensi'] = $this->status_hipertensi_dao->getDaftar();
			$this->data['imunisasi'] = $this->status_imunisasi_dao->getDaftar();
			$this->data['tbc'] = $this->status_tbc_dao->getDaftar();
			$this->session->set_userdata('user_url', $user_url);

			if ($id_anggota) {
				$this->data['objanggota'] = $this->individu_dao->getInfoIndividu($id_anggota);
				$this->session->set_userdata('user_url', $user_url . '/' . $id_anggota);
			}

			$this->load_view('admin/list_keluarga', $this->data);
		}
	}

	private function fetch_input() {
		$data = array (
			'no_kk' => $this->input->post('no_kk'),
			'alamat' => $this->input->post('alamat'),
			'lat' => $this->input->post('lat'),
			'lon' => $this->input->post('lon')
		);

		return $data;
	}

	private function get_list_kamar() {
		$totalRow = $this->input->post('totalRowKmr');

		$listkamar = array();
		for ($i = 1; $i <= $totalRow; $i++) {
			$namakamar = $this->input->post('kmr_' . $i);
			$terisi = $this->input->post('filledKmr_' . $i);
			array_push($listkamar, array('nama' => $namakamar, 'terisi' => $terisi));
		}
		return $listkamar;
	}

	public function add_keluarga() {
		$obj = $this->fetch_input();
		
		if ($this->keluarga_dao->saveNewKeluarga($obj))
			$this->session->set_flashdata("success", "Data keluarga baru berhasil disimpan.");
		else
			$this->session->set_flashdata("failed", "Data keluarga baru gagal disimpan.");

		redirect(self::$CURRENT_CONTEXT);
	}

	public function edit_keluarga() {
		$obj = $this->fetch_input();
		$id_keluarga = $this->input->post('id_keluarga');

		if ($this->keluarga_dao->editKeluarga($id_keluarga, $obj))
			$this->session->set_flashdata("success", "Data keluarga baru berhasil diubah.");
		else
			$this->session->set_flashdata("failed", "Data keluarga baru gagal diubah.");

		redirect(self::$CURRENT_CONTEXT . '/edit/' . $id_keluarga);
	}

	public function delete($id_keluarga = null){
		$obj_id = array('id_keluarga' => $id_keluarga);

		if ($this->keluarga_dao->delete($obj_id))
			$this->session->set_flashdata("success", "Hapus Keluarga berhasil.");
		else
			$this->session->set_flashdata("failed", "Hapus Keluarga gagal! Cek apakah data keluarga memiliki data anggota yang terhubung.");

		redirect(self::$CURRENT_CONTEXT);
	}

	private function fetch_input_anggota(){
		$data = array (
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'bpjs' => $this->input->post('bpjs'),
			'kelamin' => $this->input->post('jk'),
			'ttl' => $this->input->post('ttl'),
			'agama' => $this->input->post('agama'),
			'pendidikan' => $this->input->post('pendidikan'),
			'pekerjaan' => $this->input->post('pekerjaan'),
			'bb' => $this->input->post('bb'),
			'tb' => $this->input->post('tb'),
			'tensi_sistol' => $this->input->post('tensi_sistol'),
			'tensi_diastol' => $this->input->post('tensi_diastol'),
			'gula_darah' => $this->input->post('gula_darah'),
			'penyakit_saat_ini' => $this->input->post('penyakit_saat_ini'),
			'dm' => $this->input->post('dm'),
			'hipertensi' => $this->input->post('hipertensi'),
			'tbc' => $this->input->post('tbc'),
			'dbd' => $this->input->post('dbd'),
			'hiv' => $this->input->post('hiv'),
			'tb_hiv' => $this->input->post('tb_hiv'),
			'imunisasi' => $this->input->post('imunisasi'),
			'kehamilan' => $this->input->post('kehamilan'),
			'tgl_periksa' => $this->input->post('tgl_periksa'),
			'id_rumah' => $this->input->post('id_keluarga')
		);

		return $data;
	}

	public function add_anggota() {
		$objindiv = $this->fetch_input_anggota();

		if ($this->individu_dao->saveNewIndividu($objindiv))
			$this->session->set_flashdata("success", "Data individu baru berhasil disimpan.");
		else
			$this->session->set_flashdata("failed", "Data individu baru gagal disimpan.");

		redirect(self::$CURRENT_CONTEXT . '/edit/' . $objindiv['id_rumah']);
	}

	public function edit_anggota() {
		$objindiv = $this->fetch_input_anggota();
		$id_indiv = $this->input->post('id_individu');
		
		if ($this->individu_dao->editIndividu($id_indiv, $objindiv))
			$this->session->set_flashdata("success", "Data individu baru berhasil diubah.");
		else
			$this->session->set_flashdata("failed", "Data individu baru gagal diubah.");

		redirect(self::$CURRENT_CONTEXT . '/edit/' . $objindiv['id_rumah'] . '/' . $id_indiv);
	}

	public function del_anggota($id_anggota, $id_keluarga = null){
		$obj_id = array('id_individu' => $id_anggota);

		if ($this->individu_dao->delete($obj_id))
			$this->session->set_flashdata("success", "Hapus Anggota berhasil!");
		else
			$this->session->set_flashdata("failed", "Hapus Anggota gagal! Cek apakah data keluarga memiliki data anggota yang terhubung.");

		redirect(self::$CURRENT_CONTEXT . '/edit/' . $id_keluarga);
	}
	
	function role_user() {
		$user_id = $this->tank_auth->get_user_id();
		// $user = $this->user_role_dao->fetch_record($user_id);
		$this->data['permission'] = 'admin';

		// if (trim($user->role_name) == 'viewer') {
		// 	redirect('html/map_clean');
		// }
	}
	
	function logged_in() {
		if (!$this->tank_auth->is_logged_in()) {
			redirect('home/login');
		}
	}
}