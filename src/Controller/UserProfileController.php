<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\PasswordHasher\PasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/user/profile')]
class UserProfileController extends AbstractController
{
    #[Route('/', name: 'app_user_profile_index', methods: ['GET'])]
    public function index(UserRepository $userRepository): Response
    {
        return $this->render('user_profile/index.html.twig', [
            'users' => $userRepository->findAll(),
        ]);
    }

    #[Route('/{id}', name: 'app_user_profile_show', methods: ['GET'])]
    public function show(User $user): Response
    {
        return $this->render('user_profile/show.html.twig', [
            'user' => $user,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_user_profile_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user, UserRepository $userRepository,UserPasswordHasherInterface $encoder): Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $user = $form->getData();
            $user->setPassword($encoder->hashPassword($user, $form["password"]->getData()));
            $userRepository->save($user, true);

            return $this->redirectToRoute('app_user_profile_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('user_profile/edit.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }

}
