<?php

namespace App\Entity;

use App\Repository\OrderRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrderRepository::class)]
#[ORM\Table(name: '`order`')]
class Order
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 20)]
    private ?string $code = null;

    #[ORM\Column(length: 255)]
    private ?string $ids = null;

    #[ORM\Column(length: 255)]
    private ?string $counts = null;

    #[ORM\Column(length: 255)]
    private ?string $totalprice = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getIds(): ?string
    {
        return $this->ids;
    }

    public function setIds(string $ids): self
    {
        $this->ids = $ids;

        return $this;
    }

    public function getCounts(): ?string
    {
        return $this->counts;
    }

    public function setCounts(string $counts): self
    {
        $this->counts = $counts;

        return $this;
    }

    public function getTotalprice(): ?string
    {
        return $this->totalprice;
    }

    public function setTotalprice(string $totalprice): self
    {
        $this->totalprice = $totalprice;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }
}
