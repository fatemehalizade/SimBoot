<?php

namespace App\Form;

use App\Entity\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('image',FileType::class, ['label' => 'image (png, jpeg)', 'required' => false,'mapped' => false])
            ->add('price')
            ->add('description')
            ->add('suggested',ChoiceType::class, [
                'choices'  => [
                    'Yes' => 1,
                    'No' => 0,
                ]
            ])
            ->add('created_at')
            ->add('category_id')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
        ]);
    }
}
