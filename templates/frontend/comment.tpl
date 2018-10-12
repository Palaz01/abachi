{if sizeof($currentComments)!=0}
 <!--comments starts here-->
            <div class="comments">
              <h2>KOMMENTEK</h2>
               {foreach from=$currentComments item=comment}         
              <div class="item">
                <img src="images/pic3.gif" alt="" title="" />
                
                <div class="text_container">

                  <div class="ful"></div>
                  
                  <div class="top">
                    <p class="name">{$comment.comname}</p>
                    <p class="date">{$comment.comdate}</p>
                    <br class="clear" />
                  </div>
                  
                  <p>{$comment.comtext|nl2br}</p>

                </div>
                <br class="clear" />
              </div>
              {/foreach}

            </div>

            <!--comments ends here-->

    
{/if}    
    




 {include file='errors.tpl'}
 
 <a name="comment"></a>
 
 {if $data.comments==1}

 <!--comment now starts here-->
            <div class="comment_now">
              <h2>SZÓLJ HOZZÁ!</h2>
              
              <div class="form">
		   <form action="{$formAction}#comment" method="post">
                  <div>
		  {if $userbelepett!=""}
		  <input type="text" name="comname" placeholder="Név" readonly value="{$userbelepett}" />
		  {else}
		  <input type="text" name="comname" placeholder="Név" value="{$comname}" />
		  {/if}
                  </div>
                  
                  <div>
		    {if $userbelepettemail!=""}                  
		      <input type="text" name="comemail" placeholder="e-mail" readonly value="{$userbelepettemail}" />
		    {else}  
		      <input type="text" name="comemail" placeholder="e-mail" value="{$comemail}" />
		    {/if}
                  </div>  
                  
                  <div class="textarea">

                   <textarea name="comtext" wrap="soft" placeholder="Szöveg" cols="" rows="">{$comtext}</textarea>
                  </div>  
                   
                  <div class="check">
                    <input placeholder="Ellenőrző kód" name="checkbot" type="text" value=""  />
                    <img src="/botcheck2.php?r={$rstr}" />
                  </div>   
                  <input type="hidden" name="postcomment" value="1" />
		  <input type="hidden" name="cikkcomment" value="1" />
                  <div class="submit">
                    <input type="submit" value="ELKÜLDÉS" />

                  </div>                                                    
                </form>
</div>
            </div>              
{/if}

            <!--comment now ends here-->
  

