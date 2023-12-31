<?php

namespace App\Controller;

use App\Entity\Order;
use App\Repository\BlogRepository;
use App\Repository\CategoryRepository;
use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use App\Repository\ScoreRepository;
use App\Repository\SliderRepository;
use App\Repository\WebSiteProfileRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    #[Route('/', name: 'app_index')]
    public function index(SliderRepository $sliderRepository,BlogRepository $blogRepository,CategoryRepository $categoryRepository,ProductRepository $productRepository,ScoreRepository $scoreRepository,WebSiteProfileRepository $webSiteProfileRepository): Response
    {
        $sliders=$sliderRepository->findAll();
        $blogs=$blogRepository->findAll();
        $categories=$categoryRepository->findAll();
        $offerProducts=$productRepository->findBy(['suggested' => 1]);

        $productScores=[];
        $allProducts=$productRepository->findAll();
        foreach ($allProducts as $key => $product) {
            $allScores=$scoreRepository->findBy(['product' => $product->getId()]);
            if($allScores){
                $sumScore=0;
                foreach ($allScores as $key => $score) {
                    $sumScore += $score->getScore();
                }
                $avgScore=$sumScore / count($allScores);
                $productScores[$product->getId()]=$avgScore;
            }
            else{
                $productScores[$product->getId()]=0;
            }
        }
        arsort($productScores);
        $scoreProducts=[];
        foreach ($productScores as $key => $productScore) {
            $scoreProducts[]=$productRepository->find($key);
        }

        $profile=$webSiteProfileRepository->find(1);
        return $this->render('index/index.html.twig', [
            'controller_name' => 'IndexController',
            'sliders' => $sliders,
            'blogs' => $blogs,
            'categories' => $categories,
            'offerProducts' => $offerProducts,
            'moreScoreProducts' => $scoreProducts,
            'moreScoreProductsScores' => $productScores,
            'profile' => $profile
        ]);
    }

    #[Route('/basket/{id}', name: 'app_add_basket')]
    public function addBasket($id,SessionInterface $session)
    {
        // $session = new Session();
        // $session->start(); 
        // $session->clear();  (destroy session)
        $idsList=[];
        $idCounts=[];
        $idsList=$session->get("ids");
        if(isset($idsList)){
            if (count($idsList) > 0) {
                if(in_array($id,$session->get("ids"))){
                    $idKey=array_search($id,$session->get("ids"));
                    $countsList=$session->get("counts");
                    $count=$countsList[$idKey];
                    $count=$count+1;
                    $countsList[$idKey]=$count;
                    $session->set("counts",$countsList);
                }
                else{
                    $idsList=$session->get("ids");
                    $idsList[]=$id;
                    $session->set("ids",$idsList);
                    $countsList=$session->get("counts");
                    $countsList[]=1;
                    $session->set("counts",$countsList);
                }
            }
            else{
                $idsList[]=$id;
                $idCounts[]=1;
                $session->set("ids",$idsList);
                $session->set("counts",$idCounts);
            }
        }
        else{
            $idsList[]=$id;
            $idCounts[]=1;
            $session->set("ids",$idsList);
            $session->set("counts",$idCounts);
        }
        return $this->redirectToRoute('app_index');
    }

    #[Route('/basket', name: 'app_basket')]
    public function basket(SessionInterface $session,ProductRepository $productRepository) : Response
    {
        $ids=$session->get("ids");
        $counts=$session->get("counts");
        $productsList=[];
        $sum=0;
        if($ids){
            foreach ($ids as $key => $id) {
                $product=$productRepository->find($id);
                $totalPrice=$product->getPrice() * $counts[$key];
                $sum += $totalPrice;
                $productsList[]=[
                    "id" => $product->getid(),
                    "name" => $product->getName(),
                    "image" => $product->getImage(),
                    "basePrice" => $product->getPrice(),
                    "count" => $counts[$key],
                    "totalPrice" => $totalPrice
                ];
            }
        }
        return $this->render('index/basket.html.twig', [
            'products' => $productsList,
            'allPrice' => $sum
        ]);
    }

    #[Route('/order/save', name: 'app_save_order')]
    public function saveOrder(EntityManagerInterface $entityManager,SessionInterface $session,ProductRepository $productRepository,OrderRepository $orderRepository) : Response
    {
        $order=new Order();
        $ids=$session->get("ids");
        $counts=$session->get("counts");
        $idStr="";
        $countStr="";
        $sum=0;
        $code=rand(10000,99999);
        foreach ($ids as $key => $id) {
            $product=$productRepository->find($id);
            $idStr .= $id." ";
            $countStr .= $counts[$key]." ";
            $sum += $product->getPrice() * $counts[$key];
        }
        $order->setCode($code);
        $order->setIds($idStr);
        $order->setCounts($countStr);
        $order->setTotalprice($sum);
        $date=new \DateTimeImmutable();
        $order->setCreatedAt($date);

        // tell Doctrine you want to (eventually) save the Product (no queries yet)
        $entityManager->persist($order);

        // actually executes the queries (i.e. the INSERT query)
        $entityManager->flush();

        $session->clear();

        return $this->render('index/factor.html.twig', [
            'code' => $code,
            'message' => 'Your order has been successfully registered :)'
        ]);
    }
}
