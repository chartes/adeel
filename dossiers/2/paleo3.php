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
    La ponctuation, sans &ecirc;tre parfaitement 

        rigoureuse, est soign&eacute;e. Comme il convient &agrave; un texte destin&eacute; 

        &agrave; une lecture &agrave; haute voix, elle contribue &agrave; la structuration 

        du texte en distinguant des pauses d'importance diff&eacute;rente (plut&ocirc;t 

        que des unit&eacute;s de sens). </p>

      <ul>

        <li><i>comma</i>, un point l&eacute;g&egrave;rement &eacute;lev&eacute; 

          = pause courte (cf. notre virgule), fr&eacute;quente&nbsp;;</li>

        <li><i>colon</i>, un point-virgule invers&eacute; = pause moyenne (cf.&nbsp;notre 

          point-virgule), apr&egrave;s <i>Oremus</i>&nbsp;;</li>

        <li><i>periodus</i>, ici un deux-points-virgule = pause forte (cf.&nbsp;notre 

          point), &agrave; la fin d'une pri&egrave;re (10 gauche).</li>

      </ul>

      <p>On notera que le <i>periodus</i> est appliqu&eacute; &agrave; une pri&egrave;re 

        compl&egrave;te, tandis que le <i>comma</i> est employ&eacute; pour celles 

        qui se concluent par une formule r&eacute;duite &agrave; ses premiers 

        mots, <i>per Dominum</i> ou <i>per Dominum nostrum</i> (ce que notre transcription 

        rend par des points de suspension).</p>
		

</div>
<p style="clear:both">&nbsp;</p>
