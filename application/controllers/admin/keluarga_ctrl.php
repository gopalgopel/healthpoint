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
		$this->load->model('Kosts','',TRUE);

		$this->logged_in();
		$this->role_user();
		// $this->data['permission'] = all_permission_string($this->session->userdata('user_id'));
		// $this->data['idAccessMsg'] = $this->session->userdata(SESSION_USERMSGID);
		// $this->data['user_id'] = '5ae977774b77e8711e0c4e92';
		// $this->data['user_id'] = '5ae039b33e0b2a360b304585'; // p ddg
		$this->data['user_id'] = $this->session->userdata('user_id');
	}

	public function index($offset=0 ,$limit=16){
		$this->preload();
		$this->load_view('admin/list_keluarga', $this->data);
	}

	public function preload(){
		$this->data['current_context'] = self::$CURRENT_CONTEXT;
		$this->data['title'] = self::$TITLE;

		$this->data['objkel'] = null;
		$this->data['individus'] = null;
		$this->data['objanggota'] = null;
		$this->data['keluargas'] = $this->keluarga_dao->getDaftarKeluarga();
	}

	public function load_view($page, $data = null){
		$this->load->view('template/template_header',$data);
		$this->load->view('template/template_menu',$this->data);
		$this->load->view($page, $data);
		$this->load->view('template/template_footer');
	}

	public function edit($id_keluarga, $id_kamar = null){
		$this->preload();

		if ($id_keluarga == null) {
			$this->load_view('admin/list_keluarga');
		} else {
			// $this->data['obj'] = $this->Kosts->getInfoKosan($this->data['user_id'], urldecode($kosan_judul));
			$this->data['objkel'] = $this->keluarga_dao->getInfoKeluarga($id_keluarga);
			// $this->data['kamars'] = $this->kamar_dao->getDaftarKamar($id_kosan);
			$this->data['individus'] = $this->individu_dao->getDaftarAnggotaKeluarga($id_keluarga);

			// ambil daftar2 opsi
			$this->data['agama'] = $this->daftar_agama_dao->getDaftarAgama();
			$this->session->set_userdata('user_url', self::$CURRENT_CONTEXT . '/edit/' . $id_keluarga);
			if ($id_kamar) {
				$this->data['objkamar'] = $this->kamar_dao->getInfoKamar($id_kamar);
				$this->data['penghuni'] = $this->penghuni_dao->getPenghuniKamar($id_kamar);
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
		$infoSession = ''; // added by SKM17

		$obj = $this->fetch_input();
		
		if ($this->keluarga_dao->saveNewKeluarga($obj))
			$infoSession .= "Keluarga baru berhasil disimpan. ";
		else
			$infoSession .= "<font color='red'>Keluarga baru gagal disimpan. </font>";

		$this->session->set_flashdata("info", $infoSession);
		redirect(self::$CURRENT_CONTEXT);
	}

	public function edit_keluarga() {
		$infoSession = ''; // added by SKM17

		$obj = $this->fetch_input();
		$id_keluarga = $this->input->post('id_keluarga');

		if ($this->keluarga_dao->editKeluarga($id_keluarga, $obj))
			$infoSession .= "Data Keluarga berhasil diubah. ";
		else
			$infoSession .= "<font color='red'>Data Keluarga gagal diubah. </font>";

		$this->session->set_flashdata("info", $infoSession);
		redirect(self::$CURRENT_CONTEXT);
	}

	public function delete($kosan_judul = null){
		$id_user = $this->data['user_id'];
		$this->Kosts->deleteKosan($id_user, urldecode($kosan_judul));
		$this->session->set_flashdata("info", "Hapus Data Kosan berhasil!");

		redirect(self::$CURRENT_CONTEXT);
	}

	private function fetch_input_anggota(){
		$data = array (
			'nama' => $this->input->post('nama'),
			'nik' => $this->input->post('nik'),
			'bpjs' => $this->input->post('bpjs'),
			'kelamin' => $this->input->post('jk'),
			'agama' => $this->input->post('agama'),
			'id_rumah' => $this->input->post('id_keluarga')
		);

		return $data;
	}

	public function add_anggota() {
		$infoSession = ''; // added by SKM17

		$objindiv = $this->fetch_input_anggota();

		if ($this->individu_dao->saveNewIndividu($objindiv))
			$infoSession .= "Individu baru berhasil disimpan. ";
		else
			$infoSession .= "<font color='red'>Individu baru gagal disimpan. </font>";

		$this->session->set_flashdata("info", $infoSession);
		// redirect($this->session->userdata('user_url'));
		redirect(self::$CURRENT_CONTEXT);
	}

	public function edit_kamar() {
		$infoSession = ''; // added by SKM17

		$objkamar = $this->fetch_input_anggota();
		$id_kamar = $this->input->post('id_kamar');
		
		if ($this->kamar_dao->editKamar($id_kamar, $objkamar))
			$infoSession .= "Data Kamar berhasil diubah. ";
		else
			$infoSession .= "<font color='red'>Data Kamar gagal diubah. </font>";

		$this->session->set_flashdata("info", $infoSession);
		redirect($this->session->userdata('user_url'));
	}

	private function fetch_input_penghuni(){
		$data = null;
		$data = array(
			'nama_penghuni' => $this->input->post('nama_penghuni'),
			'no_ktp' => $this->input->post('noktp'),
			'alamat' => $this->input->post('alamat'),
			'hp' => $this->input->post('hp'),
			// 'tglmasuk' => $this->input->post('tglmasuk'),
			// 'tglkeluar' => $this->input->post('tglkeluar'),
			'hpdarurat' => $this->input->post('hpdarurat')
		);

		return $data;
	}

	public function add_penghuni() {
		$infoSession = ''; // added by SKM17

		$objpenghuni = $this->fetch_input_penghuni();
		$objpenghuni['id_kamar'] = $this->input->post('id_kamar');

		if ($this->penghuni_dao->saveNewPenghuni($objpenghuni))
			$infoSession .= "Penghuni baru berhasil disimpan. ";
		else
			$infoSession .= "<font color='red'>Penghuni baru gagal disimpan. </font>";

		$this->session->set_flashdata("info", $infoSession);
		redirect($this->session->userdata('user_url'));
	}

	public function edit_penghuni() {
		$infoSession = ''; // added by SKM17

		$objpenghuni = $this->fetch_input_penghuni();
		$id_penghuni = $this->input->post('id_penghuni');
		
		if ($this->penghuni_dao->editPenghuni($id_penghuni, $objpenghuni))
			$infoSession .= "Data Penghuni berhasil diubah. ";
		else
			$infoSession .= "<font color='red'>Data Penghuni gagal diubah. </font>";

		$this->session->set_flashdata("info", $infoSession);
		redirect($this->session->userdata('user_url'));
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