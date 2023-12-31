<?php

namespace App\Controller;

use App\Entity\WebSiteProfile;
use App\Form\WebSiteProfileType;
use App\Repository\WebSiteProfileRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/web/site/profile')]
class WebSiteProfileController extends AbstractController
{
    #[Route('/', name: 'app_web_site_profile_index', methods: ['GET'])]
    public function index(WebSiteProfileRepository $webSiteProfileRepository): Response
    {
        return $this->render('web_site_profile/index.html.twig', [
            'web_site_profiles' => $webSiteProfileRepository->findAll(),
        ]);
    }

    #[Route('/{id}', name: 'app_web_site_profile_show', methods: ['GET'])]
    public function show(WebSiteProfile $webSiteProfile): Response
    {
        return $this->render('web_site_profile/show.html.twig', [
            'web_site_profile' => $webSiteProfile,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_web_site_profile_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, WebSiteProfile $webSiteProfile, WebSiteProfileRepository $webSiteProfileRepository): Response
    {
        $form = $this->createForm(WebSiteProfileType::class, $webSiteProfile);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $logoFile=$form->get('logo')->getData();
            if ($logoFile) {
                $newName=md5(time()).".".$logoFile->guessExtension();
                $logoFile->move("public/upload",$newName);
            }
            $webSiteProfile->setLogo($newName);
            $webSiteProfileRepository->save($webSiteProfile, true);

            return $this->redirectToRoute('app_web_site_profile_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('web_site_profile/edit.html.twig', [
            'web_site_profile' => $webSiteProfile,
            'form' => $form,
        ]);
    }

}
