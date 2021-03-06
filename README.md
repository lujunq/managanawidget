MANAGANA

Managana is a free cross-platform software for digital publication based on imagination as interface. Created by the Ciclope atelier, it allows the creation and maintenance of communities that share interactive content on the web, tablets, smartphones and exhibits. Each community has interactive streams composed of clusters of audiovisual, graphics, text and external feeds. Managana mixes and sequences play lists that can be created, displayed, and animated in the software itself.

Visit http://www.managana.org for further information. Also, check out our video: https://www.youtube.com/watch?v=HM5Zs32N5MY


INTERACTIVE WIDGETS API

This repository comes with the widgets api code. Widgets are build as swf files that can be loaded by the Managana player at runtime to extend functionality. Some limitations on iOS version of the Managana player apply (only offline content packaged with the application can use widgets).


LICENSE

Managana is licensed under the LGPL v3 terms.


CODE

Managana source code is split among its various modules. All the related repositories contain a FlashDevelop (www.flashdevelop.org) project ready to be build. Managana uses the Apache Flex SDK (flex.apache.org) instead of the Adobe one.

To build any Managana project you'll need to add the Ciclope AS3 classes (https://github.com/lujunq/ciclopeas3) to your classpath. You'll also need other free third party libraries listed at the "about extensions and libraries.txt" text.

AS3 CLASSES: https://github.com/lujunq/ciclopeas3
WEB PLAYER: https://github.com/lujunq/managanawebplayer
APP PLAYER: https://github.com/lujunq/managanaappplayer
WEB EDITOR: https://github.com/lujunq/managanaeditor
INTERACTIVE WIDGETS API: https://github.com/lujunq/managanawidget