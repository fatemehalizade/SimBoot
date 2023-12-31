<?php

namespace App\Controller;

use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderController extends AbstractController
{
    #[Route('/order', name: 'app_order')]
    public function index(OrderRepository $orderRepository,ProductRepository $productRepository): Response
    {
        $orders=$orderRepository->findAll();
        $ordersList=[];
        
        foreach ($orders as $key => $order) {
            $productList=[];
            $ids=explode(" ",trim($order->getIds()));
            $counts=explode(" ",trim($order->getCounts()));
            foreach ($ids as $key => $id) {
                $productList[$key]=$productRepository->find($id);
            }
            $ordersList[]=[
                "counts" => $counts,
                "totalPrice" => $order->getTotalprice(),
                "code" => $order->getCode(),
                "products" => $productList
            ];
        }
        
        return $this->render('order/index.html.twig', [
            'orders' => $ordersList
        ]);
    }
}
