<?php
	include_once'../../models/Blogers.php';
	include_once'../../config/Database.php';
	
	// Instance 
	$databes=new Database();
	$db=$database->getConnexion();
	
	$bloger=new Bloger($db);
	if(isset($_POST['saved']))
	{
		$bloger->nom=$_POST['nom'];
		$bloger->postnom=$_POST['postnom'];
		$bloger->adresse=$_POST['adresse'];
		$bloger->email=$_POST['email'];
		$bloger->phone=$_POST['phone'];
		$bloger->password=md5($_POST['password']);
		
		// Quering for method
		$bloger->createBloger();
		
	}