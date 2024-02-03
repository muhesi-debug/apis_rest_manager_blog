<?php
	class Database
	{
		// Attribut 
		private $host="localhost";
		private $dbName="manager_blog";
		private $userName="root";
		private $pwsdb="";
		
		// Méthode de la connexion 
		public function getConnexion()
		{
			$conn=null;
			try
			{
				$conn=new PDO("mysql:host=$this->host;dbname=$this->dbName",$this->userName,$this->pwsdb,
				[
					PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
				]
				);
				return $conn;
			}
			catch(\PDOException $e)
			{
				echo("Erreur: ".$e->getMessage());
			}
			
		}
	}