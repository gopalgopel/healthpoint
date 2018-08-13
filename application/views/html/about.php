<html>

<!-- include another html page -->
<!-- include another html page,, cara makenya: -->
<!-- <div w3-include-html="h1.html"></div>  -->

<head>
	<style>
			html, body, #container {
			  height: 100%;
			  width: 100%;
			  overflow-x: hidden;
			  overflow-y: auto;
			  padding-top: 50px;
			}
			body {
			  padding-top: 50px;
			}
			input[type="radio"], input[type="checkbox"] {
			  margin: 0;
			}

			td.details-control {
			    background: url('<?php echo base_url() ?>assets/html/img/icon/pl.png') no-repeat center center;
			    cursor: pointer;
			}
			tr.shown td.details-control {
			    background: url('<?php echo base_url() ?>assets/html/img/icon/mn.png') no-repeat center center;
			}

			@font-face { font-family: sshh; src: url('../aset/fonts/sshh.ttf'); } 
			h1 {font-family: sshh}

	</style>
	<meta charset=utf-8 />
	<title>Kost Putri EDUMEDIA</title>
	<meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />

	<!-- Bootstrap Core CSS -->
    <link href="<?php echo base_url() ?>vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<?php echo base_url() ?>vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<?php echo base_url() ?>vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<?php echo base_url() ?>vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?php echo base_url() ?>dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="<?php echo base_url() ?>dist/css/datatable.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?php echo base_url() ?>vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link rel="icon" type="image/x-icon" href="<?php echo base_url() ?>favicon.ico">
	<link rel="stylesheet" href="<?php echo base_url() ?>aset/font-awesome.min.css" />
	<link rel="stylesheet" href="<?php echo base_url() ?>aset/ResilientMaps.css" />
	<!-- <link rel="stylesheet" href="<?php echo base_url() ?>aset/bootleaf/app.css" /> -->
	
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header" style="vertical-align:middle;"">
				<!-- <img class="pull-left" style="width:41px;height:41px;margin-top:5px;z-index:999;" src="<?php echo base_url() ?>aset/img/1.png"> -->
				<img class="pull-left" style="vertical-align:middle; width:30px;height:30px;margin-top:5px;z-index:999;" src="<?php echo base_url() ?>aset/img/1.png">
				<!-- <a class="navbar-brand" style="font-family:sshh;font-size:30;font-weight: normal;margin-top:0px;" href="#" data-toggle="collapse" data-target=".navbar-collapse.in" id="sidebar-legend-btn">&nbsp;Kost Putri EDUMEDIA</a> -->
				<a class="navbar-brand" style="color:white; vertical-align:middle; font-family:sshh;font-size:20;font-weight: normal;margin-top:0px;" href="#" data-toggle="collapse" data-target=".navbar-collapse.in" id="sidebar-legend-btn">&nbsp;Kost Putri EDUMEDIA&nbsp;</a>
                <ul class="nav navbar-nav pull-center">
                    <li class="btn-group btn-group-sm" style="vertical-align:middle; margin-top:10px;" role="group">
                        <button type="button" class="btn btn-success" id="peta"><i class="fa fa-map"></i>  Peta</button>
                        <button type="button" class="btn btn-primary" id="tabel"><i class="fa fa-table"></i>  Lihat Tabel</button>
                        <button type="button" class="btn btn-warning" id="about"><i class="fa fa-info-circle"></i> About</button>
                    </li>
                </ul>
            </div>
            <ul class="pull-right">
                <i style="vertical-align:middle; font-family:'Arial'; color:white;  font-size:15; font-weight:normal; margin-top:8px">Welcome <?php if ($username) echo $username ?>&nbsp;</i>
                <li class="btn-group btn-group-sm" style="vertical-align:middle; margin-top:10px;" role="group">
                    
<?php if ($permission) { ?>
                    <button type="button" class="btn btn-info" id="backend"><i class="fa fa-gears"></i>  Halaman Admin</button>
                    <button type="button" class="btn btn-danger" id="logout" onclick="location.href='http://google.com';"><i class="fa fa-sign-out"></i>  Logout</button>
<?php } else { ?>       
                    <button type="button" class="btn btn-info" id="login"><i class="fa fa-gears"></i>  Login</button>
<?php } ?> 
                </li>
			</ul>
				
			<!-- </div> /.navbar-collapse  -->
		</div>
	</div>

	<div id="container">
		
            <div class="row">
                <div class="col-lg-12">
                    <img class="pull-center" style="
                    display: block;
                    margin-left: auto;
                    margin-right: auto;
                    vertical-align:middle; 
                    height:150px;
                    margin-top:0px;
                    z-index:999;" src="<?php echo base_url() ?>aset/img/1.png">
                    <div class="col-lg-2"></div>
                    <div style="
                    text-align: center;
                    margin-left: auto;
                    margin-right: auto;" class="col-lg-8"><p>Hubungi kami jika ingin ikut serta mengiklankan kost/kontrakan anda di web ini.<br>Sertakan juga nama, alamat email, no NPWP, beserta no HP. Nanti kami akan membuatkan akun khusus untuk anda.<br>Anda akan kami beritahu lewat email & HP, kemudian anda bisa menginput data sendiri menggunakan akun yang kami beri.</p>
                    <p><b>Ngiklan disini gratis, kecuali kalo mau nyumbang, boleh aja :)
                    <br>BNI 0022318188 an Naufal El Farisi M<br>Mandiri 132-00-1634-8717 an Naufal El Farisi M</b></p></div>
                    <div class="col-lg-2"></div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
              <div class="col-lg-3"></div>
              <div class="col-lg-6">
                <form class="form-horizontal" action="/action_page.php">
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="nama">Nama :</label>
                    <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="nama" placeholder="Nama Lengkap">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email :</label>
                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="email" placeholder="Alamat Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="hp">No HP :</label>
                    <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="hp" placeholder="No HP">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="control-label col-sm-2" for="npwp">No NPWP :</label>
                    <div class="col-sm-10"> 
                      <input type="text" class="form-control" id="npwp" placeholder="No NPWP">
                    </div>
                  </div>  
                  <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-default">Submit</button>
                      <button type="reset" class="btn btn-default">Reset</button>
                    </div>
                  </div>
                </form>
              </div>
              <div class="col-lg-3"></div>
            </div>

            <div class="row" style="
                    text-align: center;
                    margin-left: auto;
                    margin-right: auto;">
                <hr style="border-width: 5px;">
                <!-- <div class="col-lg-12" > -->
                    Copyrights &copy; 2018 <a target="_blank" href="https://www.youtube.com/c/resilientonamission"><strong>Gopal & Sesdika</strong></a>. All Rights Reserved.
                <!-- </div> -->
            </div>
	</div>
	<!-- container -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <!-- <script src="<?php echo base_url() ?>aset/jQuery-v3.1.1.js"></script> -->
    <script>
    var LOGINSTAT = false;
    $("#login").click(function() {
	window.location.href = "../home/login";
	});
	$("#logout").click(function() {
		window.location.href = "../home/logout";
	});
	$("#backend").click(function() {
		window.location.href = "../admin/pemilik_ctrl";
	});
    $("#tabel").click(function() {
    window.location.href = "../html/tabelkost";
    });
	$("#peta").click(function() {
		window.location.href = "../html/map";
	});

    </script>


</body>

</html>
