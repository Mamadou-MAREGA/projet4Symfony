<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ModeleRepository")
 */
class Modele
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Libelle;

    /**
     * @ORM\Column(type="float")
     */
    private $prixMoyen;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $image;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Voiture", mappedBy="modele")
     */
    private $modele;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Marque", inversedBy="marque")
     */
    private $marque;

    public function __construct()
    {
        $this->modele = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->Libelle;
    }

    public function setLibelle(string $Libelle): self
    {
        $this->Libelle = $Libelle;

        return $this;
    }

    public function getPrixMoyen(): ?float
    {
        return $this->prixMoyen;
    }

    public function setPrixMoyen(float $prixMoyen): self
    {
        $this->prixMoyen = $prixMoyen;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    /**
     * @return Collection|Voiture[]
     */
    public function getModele(): Collection
    {
        return $this->modele;
    }

    public function addModele(Voiture $modele): self
    {
        if (!$this->modele->contains($modele)) {
            $this->modele[] = $modele;
            $modele->setModele($this);
        }

        return $this;
    }

    public function removeModele(Voiture $modele): self
    {
        if ($this->modele->contains($modele)) {
            $this->modele->removeElement($modele);
            // set the owning side to null (unless already changed)
            if ($modele->getModele() === $this) {
                $modele->setModele(null);
            }
        }

        return $this;
    }

    public function getMarque(): ?Marque
    {
        return $this->marque;
    }

    public function setMarque(?Marque $marque): self
    {
        $this->marque = $marque;

        return $this;
    }
}
