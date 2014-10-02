<?php

namespace Pugmi\Bundle\PageBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Pugmi\Bundle\PageBundle\Entity\Page;

class LoadPageData implements FixtureInterface
{
    /**
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        $home = new Page();
        $home->setTitle('Homepage');
        $home->setBody('Lorem ipsum');

        $about = new Page();
        $about->setTitle('About us');
        $about->setBody('Who we are!');

        $manager->persist($home);
        $manager->persist($about);

        $manager->flush();
    }
}