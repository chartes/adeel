<div id="commentaire"> 
<div id="dossier">Dossier <?php echo "{$id}"; ?></div>
<div id="toccommentaire"> 
  <ol>
    <?php
		  echo "<li><a href='paleographie.php?id={$id}&page=1'>Morphologie</a></li><li><a href='paleographie.php?id={$id}&page=2'>Abr&eacute;viations</a></li>
          <li><a href='paleographie.php?id={$id}&page=3'>Structuration</a></li>";
      ?>
  </ol>
  <p id="explications_paleo">Les num&eacute;ros entre parenth&egrave;ses renvoient 
    aux lignes. Pour revenir au fac-simil&eacute; interactif, cliquer sur l'image.</p>
</div>
<hr>
<div class="paleo_commentaire"> 
  <p> 
    <?php
	echo "<a href='vue.php?id={$id}'><img src='{$id}/fax.jpg' width='521' height='440' border='0' align='left' hspace='10px'></a>";
	?>
    Cette page tr&egrave;s abondamment glos&eacute;e est &eacute;crite dans une 
    <strong>minuscule caroline </strong>classique de qualit&eacute; moyenne, o&ugrave; 
    se d&eacute;tache quelques<strong> traits archa&iuml;ques</strong>. </p>
  <p>D'abord l'alternance indiff&eacute;rente de deux formes &eacute;quivalentes 
    (allographes) de la <strong>lettre 'a'&nbsp;</strong>: </p>
  <ul>
    <li><em>a</em> rond en trois traits (2 courbes parall&egrave;les et un trait 
      pour fermer la partie sup&eacute;rieure)&nbsp;;</li>
    <li><em>a</em> &agrave; crosse, qui s'est g&eacute;n&eacute;ralis&eacute; &agrave; 
      partir du IX<sup>e</sup> si&egrave;cle, ici avec une panse relativement 
      &eacute;tir&eacute;e en pointue.</li>
  </ul>
  <p>Ces deux formes s'opposent &agrave; l'ancien <em>a</em> ouvert en haut, qui 
    a &eacute;t&eacute; supplant&eacute; comme susceptible d'&ecirc;tre confondu 
    avec <em>u</em>&nbsp;: c'est l'un des aspects de l'effort m&eacute;thodique 
    de clarification et de distinction des formes qui a fait de la minuscule caroline 
    le mod&egrave;le id&eacute;al auquel notre &eacute;criture est toujours revenue. 
  </p>
  <p>S'y ajoutent des <strong>ligatures</strong>, habituelles comme le couple 
    <strong>e-t (&amp;)</strong>, mais aussi plus inattendues dans la minuscule 
    caroline, comme le couple <strong>r-t</strong> avec <em>r</em> prolong&eacute; 
    en pointe vers le haut (18), forme qui survit plus abondamment et plus lontemps 
    dans l'&eacute;criture des documents que dans celle des livres.</p>
  <p>L'&eacute;criture des gloses se distingue par quelques traits propres, l'allongement 
    (irr&eacute;gulier et mod&eacute;r&eacute;) de <em>s</em> et <em>r</em> sous 
    la ligne, <em>e</em> avec tr&egrave;s longue c&eacute;dille pour la diphtongue 
    <em>ae</em>.</p>
  <p id="suite"><a href="paleographie.php?id=4&page=2">&gt; Suite : abréviations</a></p>
</div>
<p style="clear:both">&nbsp;</p>
