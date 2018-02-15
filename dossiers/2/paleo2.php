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
    Toutes les abr�viations sp�cifiques, par contraction, portent sur les <em>nomina 
    sacra</em> (<em>Deus, Dominus, Spiritu</em>), les adjectifs qui s&#146;y rapportent 
    (<em>omnipotens, sempiterne</em>), leurs d�riv�s (<em>christianissimo, sanctificatur</em>) 
    et la titulature cl�ricale (<em>episcopis</em>), ainsi que sur le verbe <em>quesumus</em>, 
    li� par essence aux formules de pri�re. S&#146;y ajoute une seule abr�viation 
    g�n�rique&nbsp;: dans <em>sacramentorum</em> (colophon), un tilde pour <em>m</em> 
    final.</p>
  <p>La forme exacte de l'abr&eacute;viation peut varier selon l'espace dont dispose 
    le copiste (20 gauche, <em>d</em> au lieu de <em>dnm</em> pour <em>Dominum</em>).</p>
  <p id="suite"><a href="paleographie.php?id=2&page=3">&gt; Suite : ponctuation</a></p>
</div>
<p style="clear:both">&nbsp;</p>
