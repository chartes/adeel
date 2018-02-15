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
    <strong>La s&eacute;paration des mots</strong> est &agrave; peu pr&egrave;s 
    r&eacute;guli&egrave;re. Cependant les monosyllabes, pr&eacute;positions et 
    conjonctions, comme c'est tr&egrave;s souvent le cas, s'agglutinent au mot 
    voisin, et les adjectifs peuvent de m&ecirc;me se souder au substantif auquel 
    ils se rapportent. Ces groupements constituent des unit&eacute;s surtout pour 
    la prononciation (avec un accent tonique unique ou principal), et accessoirement 
    pour le sens.</p>
  <p><strong>La ponctuation</strong> utilise avec r&eacute;gularit&eacute; les 
    trois signes habituels&nbsp;:</p>
  <ul>
    <li><em>comma</em>, un point l&eacute;g&egrave;rement &eacute;lev&eacute; 
      = pause courte (cf.&nbsp;notre virgule)&nbsp;;</li>
    <li><em>colon</em>, un point-virgule renvers&eacute; = pause moyenne (cf.&nbsp;notre 
      point-virgule)&nbsp;;</li>
    <li><em>periodus</em>, ici un point-virgule simple = pause forte (cf.&nbsp;notre 
      point).</li>
  </ul>
  <p>Le <em>periodus</em> est syst&eacute;matiquement suivi d'une initiale agrandie, 
    dont la morphologie est essentiellement emprunt&eacute;e &agrave; l'onciale, 
    et dont la dimension variable introduit une hi&eacute;rarchie suppl&eacute;mentaire 
    dans le d&eacute;coupage du texte.</p>
  <p><strong>La disposition de la glose</strong> par rapport au texte n'est pas 
    planifi&eacute;e &agrave; l'avance, bien que tous deux soient de la m&ecirc;me 
    main. La glose n'est m&ecirc;me pas r&eacute;dig&eacute;e dans l'ordre du 
    texte, ce qui interdit toute mise en page logique. Elle est plac&eacute;e 
    d'abord au plus pr&egrave;s du passage comment&eacute;, soit dans l'interligne, 
    soit, si elle est plus longue, dans la marge voisine, et introduite par <em>idest</em> 
    ou <em>scilicet</em>. Au fur et &agrave; mesure du remplissage de la marge, 
    il devient n&eacute;cessaire de recourir &agrave; des signes de renvoi et 
    de placer les gloses en fonction de l'espace n&eacute;cessaire pour chacune, 
    jusque dans les marges sup&eacute;rieure et inf&eacute;rieure. Les <strong>signes 
    de renvoi</strong> sont des dessins arbitraires, qui ne peuvent constituer 
    une s&eacute;rie logique (comme nos notes appel&eacute;es par des num&eacute;ros 
    ou des lettres), et dont les formes peuvent &eacute;ventuellement pr&ecirc;ter 
    &agrave; confusion&nbsp;; aussi les mots &agrave; commenter sont-ils repris 
    par pr&eacute;caution au d&eacute;but de la glose. Le rep&eacute;rage est 
    au total bien incommode, et exige de donner aux signes de renvoi une assez 
    grande dimension pour qu'ils soient bien visibles. L'aspect de la page n'en 
    est que plus touffu.</p>
</div>
<p style="clear:both">&nbsp;</p>
