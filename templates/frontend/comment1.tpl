{if sizeof($currentComments)!=0}
<div class="opinions">
  <h2>Vélemények</h2>
    {foreach from=$currentComments item=comment}
     
   <div class="item">
                <div class="top">
                  <p class="name">Írta: {$comment.comname}</p>
                  <p class="date">{$comment.comdate}</p>
                  <br class="clear" />

                </div>
                
                <p>{$comment.comtext|nl2br}</p>
  
                <div class="rating">
                  <p>Osztályzat:</p>
                  {if $comment.rating>0}<span class="active"></span>{/if}
                  {if $comment.rating>1}<span class="active"></span>{else}<span></span>{/if}
                  {if $comment.rating>2}<span class="active"></span>{else}<span></span>{/if}
                  {if $comment.rating>3}<span class="active"></span>{else}<span></span>{/if}
                  {if $comment.rating>4}<span class="active"></span>{else}<span></span>{/if}
                  <p><i>[{$comment.rating} találat az 5-ből !]</i></p>
                </div>
              </div>
              
        {/foreach}      
</div>
{/if}    

 {include file='errors.tpl'}
 
 <a name="comment"></a>

 
 
  <!--write your opinion starts here-->
  <div class="write_your_opinion">
    <h2>Írja meg véleményét!</h2>
    
    <div class="form">
      <form action="{$formAction}#comment" method="post">
        <div>
          <label>Szerző neve</label>
		  {if $userbelepett!=""}
		  <input type="text" name="comname" readonly value="{$userbelepett}" />           
		  {else}
		  <input type="text" name="comname" value="{$comname}" />           
		  {/if}
          
        </div>
        
        <div class="textarea">
          <label>Vélemény</label>
          <textarea name="comtext" wrap="soft" cols="" rows="">{$comtext}</textarea>
        </div>  
                      
        <div class="rating">
          <label>Értékelés:</label>
          <span class="first">Rossz</span>
          {section name=counter start=1 loop=6 step=1}
          <input type="radio" name="rating" {if $rating==$smarty.section.counter.index}checked="checked"{/if} value="{$smarty.section.counter.index}" />&nbsp;      
          {/section}
          <span>Jó</span>
        </div>
        <br class="clear" />
        
        <div>
          <label>Ellenőrzés:</label>
          <p>Kérjük írja be a lent látható képen található karaktereket a szövegdobozba!</p>
        </div>
        
        <div class="check">
          <p>
            <img src="/botcheck2.php?r={$rstr}" width="110" />
            <input name="checkbot" type="text" value="" maxlength="5" />
            
            
            <input class="submit" type="submit" value="TOVÁBB" />
            <input type="hidden" name="postcomment" value="1" />            
          </p>
        </div>

        <br class="clear" />
      </form>
    </div>
  </div>