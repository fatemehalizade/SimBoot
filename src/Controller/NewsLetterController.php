<?php

namespace App\Controller;

use App\Entity\NewsLetter;
use App\Form\NewsLetterType;
use App\Repository\NewsLetterRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/news/letter')]
class NewsLetterController extends AbstractController
{
    #[Route('/', name: 'app_news_letter_index', methods: ['GET'])]
    public function index(NewsLetterRepository $newsLetterRepository): Response
    {
        return $this->render('news_letter/index.html.twig', [
            'news_letters' => $newsLetterRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_news_letter_new', methods: ['GET', 'POST'])]
    public function new(Request $request, NewsLetterRepository $newsLetterRepository,EntityManagerInterface $entityManager): Response
    {
        // $newsLetter = new NewsLetter();
        // $form = $this->createForm(NewsLetterType::class, $newsLetter);
        // $form->handleRequest($request);

        // if ($form->isSubmitted() && $form->isValid()) {
        //     $newsLetterRepository->save($newsLetter, true);

        //     return $this->redirectToRoute('app_news_letter_index', [], Response::HTTP_SEE_OTHER);
        // }

        // return $this->renderForm('news_letter/new.html.twig', [
        //     'news_letter' => $newsLetter,
        //     'form' => $form,
        // ]);
        $newsLetter=new NewsLetter();
        $params = $request->request->all();
        if($params["email"]){
            $newsLetter->setEmail($params['email']);
            $date=new \DateTimeImmutable();
            $newsLetter->setCreatedAt($date);
            
            // tell Doctrine you want to (eventually) save the Product (no queries yet)
            $entityManager->persist($newsLetter);
    
            // actually executes the queries (i.e. the INSERT query)
            $entityManager->flush();
    
            return $this->redirectToRoute('app_index', [], Response::HTTP_SEE_OTHER);

        }
        
        return $this->redirectToRoute('app_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/{id}', name: 'app_news_letter_show', methods: ['GET'])]
    public function show(NewsLetter $newsLetter): Response
    {
        return $this->render('news_letter/show.html.twig', [
            'news_letter' => $newsLetter,
        ]);
    }

}
