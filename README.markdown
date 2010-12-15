camelot
=======

camelot télécharge votre édition PDF du quotidien Le Devoir à tous les jours.

Intallation
-----------

    gem install camelot

(mechanize va être installé)

Ensuite, il faut installer le LaunchAgent (oui, ça ne fonctionne que sur Mac OS X).

    install-camelot-launch-agent

Et finalement, il faut créer un fichier de configuration nommé ~/.camelot:

    le_devoir:
        email: mon.courriel@foo.com
        password: bar
        path: '/Users/moi/Dropbox/Le Devoir'

Et voilà ! Vers 4:00 am chaque jour, camelot téléchargera l'édition PDF du Devoir et la copiera où vous le voulez.

Comme vous, votre ordinateur dors à 4:00 am ? Pas de problème ! Par la magie de launchd, camelot sera invoqué la prochaine fois que votre ordinateur sera réveillé.

Vous pouvez aussi utiliser camelot sans le LaunchAgent. Il vous suffit de l'invoquer ainsi:

    camelot

Avertissement
-------------

Cette gem est alpha-alpha-alpha. Utilisez à vos propres risques.

D'ailleurs, si vous désinstallez camelot, il faudra enlever le LaunchAgent à la main:

    launchctl unload ~/Library/LaunchAgents/com.agregoire.camelot.plist

C'est à quel point tout ça est alpha.

Contributing to camelot
-----------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2010 Alexandre Grégoire. See LICENSE.txt for further details.
