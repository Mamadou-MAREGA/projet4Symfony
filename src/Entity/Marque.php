<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MarqueRepository")
 */
class Marque
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
     * @ORM\OneToMany(targetEntity="App\Entity\Modele", mappedBy="marque")
     */
    private $marque;

    public function __construct()
    {
        $this->marque = new ArrayCollection();
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

    /**
     * @return Collection|Modele[]
     */
    public function getMarque(): Collection
    {
        return $this->marque;
    }

    public function addMarque(Modele $marque): self
    {
        if (!$this->marque->contains($marque)) {
            $this->marque[] = $marque;
            $marque->setMarque($this);
        }

        return $this;
    }

    public function removeMarque(Modele $marque): self
    {
        if ($this->marque->contains($marque)) {
            $this->marque->removeElement($marque);
            // set the owning side to null (unless already changed)
            if ($marque->getMarque() === $this) {
                $marque->setMarque(null);
            }
        }

        return $this;
    }
}
