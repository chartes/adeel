<div id="commentaire"> 
<div id="dossier">Dossier <?php echo "{$id}"; ?></div>
<div id="toccommentaire"> 
  <ol>
    <?php
		  echo "<li><a href='paleographie.php?id={$id}&page=1'>Morphologie</a></li><li><a href='paleographie.php?id={$id}&page=2'>Abr&eacute;viations</a></li>
          <li><a href='paleographie.php?id={$id}&page=3'>Ponctuation</a></li>";
      ?>
  </ol>
  <p id="explications_paleo">Les num&eacute;ros entre parenth&egrave;ses renvoient 
    aux lignes. Pour revenir au fac-simil&eacute; interactif, cliquer sur l'image.</p>
</div>
<hr>
<div class="paleo_commentaire"> 
  <p> 
    <?php
	echo "<a href='vue.php?id={$id}'><img src='{$id}/fax.jpg' width='500' height='627' border='0' align='left' hspace='10px'></a>";
	?>
    Ces deux pages du sacramentaire de Hildoard pr�sentent une <strong>minuscule 
    caroline</strong> achev�e, l�g�rement inclin�e � droite, d&#146;un module 
    assez grand destin� � faciliter la lecture liturgique mais non parfaitement 
    homog�ne, ce qui donne aux lignes un aspect un peu irr�gulier (d'autant plus 
    qu'elle tendent &agrave; monter en d�pit de la pr&eacute;sence d'une r�glure). 
  </p>
  <p>Parmi les formes particuli�res, on note <em>a</em> � panse triangulaire et 
    <em>e</em> c�dill� pour <em>ae</em> (17 gauche, <em>gratiae</em>). Le texte 
    est structur� par des <strong>initiales</strong> sobrement orn�es � l&#146;encre 
    et par la mise en relief, dans chaque pri�re, des mots initiaux (surtout <em>oremus</em>) 
    et finaux (<em>per Dominum nostrum</em>...), �crits en lettres <strong>onciales</strong>. 
  </p>
  <p>C&#146;est ici le type le plus tardif de l&#146;onciale, une �criture calligraphique, 
    artificielle, trac�e en donnant &agrave; la plume un angle d&#146;�criture 
    variable&nbsp;: les plus fortes graisses sont tant&ocirc;t obliques tant&ocirc;t 
    verticales, et les extr�mit�s des traits sont orn�es d&#146;empattements filiformes, 
    verticaux ou horizontaux. Quelques formes typiques&nbsp;: L fortement d�velopp� 
    en hauteur et en largeur, M en trois traits formant deux courbes sym�triques, 
    T de forme capitale (avec jambage rectiligne patt&eacute;). Les passages en 
    lettres onciales sont contamin�s ici et l� par l&#146;intrusion de lettres 
    soit minuscules (20 gauche, <em>per Dominum <u>nostrum</u></em>, faute de 
    place) soit v&eacute;ritablement capitales (dans le colophon, <em>Hildoar<u>d</u>us</em>).</p>
  <p>La distinction employ�e ici entre deux �critures se trouve fr�quemment dans 
    des pages plus complexes, d�velopp�e en une hi�rarchie � trois ou quatre niveaux&nbsp;: 
    capitale, onciale, semi-onciale, minuscule.</p>
  <p id="suite"><a href="paleographie.php?id=2&page=2">&gt; Suite : abr�viations</a></p>
</div>
<p style="clear:both">&nbsp;</p>
