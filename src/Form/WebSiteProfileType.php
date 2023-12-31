<?php

namespace App\Form;

use App\Entity\WebSiteProfile;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType; 

class WebSiteProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('logo',FileType::class, ['label' => 'image (png, jpeg)', 'required' => false,'mapped' => false])
            ->add('email')
            ->add('tell')
            ->add('address')
            ->add('instagram')
            ->add('youtube')
            ->add('twitter')
            ->add('facebook')
            ->add('created_at')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => WebSiteProfile::class,
        ]);
    }
}
