<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(
    '*' => array(
        'omitScriptNameInUrls' => true,
    ),
    '.dev' => array(
        'devMode' => true,
        'environmentVariables' => array(
            'siteUrl'        => 'http://hhcc-bowling.dev/',
            'fileSystemPath' => '/Users/rob.erskine/Sites/hhcc-bowling/html/'
        )
    ),
    '.com' => array(
        'environmentVariables' => array(
            'siteUrl'        => 'http://tripadvisor.hhcctech.com/',
            'fileSystemPath' => '/var/www/vhosts/tripadvisor.hhcctech.com/html/'
        )
    ),
);
