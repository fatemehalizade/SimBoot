<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductType;
use App\Repository\ProductRepository;
use App\Repository\ScoreRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/product')]
class ProductController extends AbstractController
{
    #[Route('/', name: 'app_product_index', methods: ['GET'])]
    public function index(ProductRepository $productRepository,ScoreRepository $scoreRepository): Response
    {
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
        return $this->render('product/index.html.twig', [
            'products' => $allProducts,
            'scores' => $productScores
        ]);
    }

    #[Route('/new', name: 'app_product_new', methods: ['GET', 'POST'])]
    public function new(Request $request, ProductRepository $productRepository): Response
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $imageFile=$form->get('image')->getData();
            if ($imageFile) {
                $newName=md5(time()).".".$imageFile->guessExtension();
                $imageFile->move("public/upload",$newName);
                $product->setImage($newName);
            }
            $productRepository->save($product, true);

            return $this->redirectToRoute('app_product_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('product/new.html.twig', [
            'product' => $product,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_product_show', methods: ['GET'])]
    public function show(Product $product): Response
    {
        return $this->render('product/show.html.twig', [
            'product' => $product,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_product_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Product $product, ProductRepository $productRepository): Response
    {
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $imageFile=$form->get('image')->getData();
            if ($imageFile) {
                $newName=md5(time()).".".$imageFile->guessExtension();
                $imageFile->move("public/upload",$newName);
                $product->setImage($newName);
            }
            $productRepository->save($product, true);

            return $this->redirectToRoute('app_product_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('product/edit.html.twig', [
            'product' => $product,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_product_delete', methods: ['POST'])]
    public function delete(Request $request, Product $product, ProductRepository $productRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$product->getId(), $request->request->get('_token'))) {
            $productRepository->remove($product, true);
        }

        return $this->redirectToRoute('app_product_index', [], Response::HTTP_SEE_OTHER);
    }
}
