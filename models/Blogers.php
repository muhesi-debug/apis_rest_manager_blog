<?php 
	class Bloger
	{
		// Proprietes et les methodes
		private $table='bloger';
		private $connexion=null;
		
		// Attributs
		public $id;
		public $nom;
		public $postnom;
		public $email;
		public $adresse;
		public $phone;
		public $password;
		
		// Constructeur 
		public function __construct($db)
		{
			if($this->connexion==null) $this->connexion=$db;
		}
		
		// Methode la classe 
		public function readAll()
		{
			$sql="SELECT * FROM $this->table";
			$req=$this->connexion->query($sql);
			if($req!=null) return $req;
			else return "Pas d'element";
		}
		public function createBloger()
		{
			$sql="INSERT INTO $this->table(`nom`, `postnom`, `email`, `phone`, `adresse`, `profil`) VALUES(:nom, :postnom, :email, :phone, :adresse, :profil)";
			$req=$this->connexion->prepare($sql);
			$rq=$req->execute(
				[
					':nom'=>$this->nom,
					':postnom'=>$this->postnom,
					':adresse'=>$this->adresse,
					':email'=>$this->email,
					':phone'=>$this->phone,
					':password'=>$this->password,
					':profil'=>$this->profil
				]
			);
			if($rq) return true;
			else return false;
		}
		
		public function updateBloger()
		{
			$sql="UPDATE $this->table SET nom=:nom, postnom=:postnom, email=:email, phone=:phone, adresse=:adresse, profil=:profil WHERE idBloger=:id";
			$req=$this->connexion->prepare($sql);
			$rq=$req->execute(
				[
					':id'=>$this->id,
					':nom'=>$this->nom,
					':postnom'=>$this->postnom,
					':adresse'=>$this->adresse,
					':email'=>$this->email,
					':phone'=>$this->phone,
					':password'=>$this->password,
					':profil'=>$this->profil
				]
			);
			if($rq) return true;
			else return false;
		}
	
	
		public function deleteBloger()
		{
			$sql='DELETE FROM $this->table WHERE idBloger=:id';
			$req=$this->connexion->prepare($sql);
			$rq=$req->excute(
				[
					':id'=>$this->id
				]
			);
			if($rq) return true;
			else return false;
		}
	}