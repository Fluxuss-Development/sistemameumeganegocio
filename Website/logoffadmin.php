<?php 
	session_start();
	unset($_SESSION['idf']);
	unset($_SESSION['nomef']);
	//session_destroy();
	header('location:admin');
?>