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
    Le syst&egrave;me abr&eacute;viatif recourt &agrave; des formes banales&nbsp;: 
    abr&eacute;viations g&eacute;n&eacute;riques de nasales, abr&eacute;viations 
    sur <em>p</em>, <em>nomina sacra</em>, etc. </p>
  <p>Comme souvent, il est plus d&eacute;velopp&eacute; dans la glose, o&ugrave; 
    figurent en particulier abondamment l'abr&eacute;viation tironienne pour <em>est</em> 
    (&divide;) et les formes en une lettre de <em>idest</em> (.<em>i</em>.), <em>scilicet</em> 
    (.<em>s</em>.), <em>vel</em> (<em>l</em> barr&eacute;).</p>
  <p id="suite"><a href="paleographie.php?id=4&page=3">&gt; Suite et fin&nbsp;: structuration</a></p>
</div>
<p style="clear:both">&nbsp;</p>
