<?php 
	
	
	
	// Instance de la classe 
	$database=new Database();
	$db=$database->getConnexion();
	// Instance de la class Bloger
	$bloger=new Bloger($db);
	
	$data=$bloger->readAll();
	var_dump($data);