{include file='header.tpl'}


 <div class="new_stuff_box">
          <h2 class="title">ÚJDONSÁGOK</h2>
          
          <div class="container">
          {foreach from=$productsOnMainpage item=row name=main}
            {if $smarty.foreach.main.index==0 || $smarty.foreach.main.index%2==0}
              {if $smarty.foreach.main.last || $smarty.foreach.main.index == sizeof($productsOnMainpage)-2}
              <div class="item nomargin noborder">
              {else}
              <div class="item">
              {/if}
            {/if}
            
              <div class="product">
                <img src="{#pt#}{$row.image}&w=123&h=128&far=1" alt="{$row.imgalt}" title="{$row.imgtitle}" />
                
                <div class="text_container">
                  <h2><a href="{$row.filename}.html" title="">{$row.title}</a></h2>
                  
                  <p>{$row.description}</p>
                  
                  <p class="price"><span><span>Ára: <b>{$row.finalprice|commify:-1:',':'.'} Ft</b></span></span></p>
                  <br class="clear" />
                  
                  <a href="{$row.filename}.html" title="" class="details_link">RÉSZLETEK</a>
                  {if $row.instock}<a href="#" title="" onclick="javascript:document.location='{$row.addToCartFilename}.html';" class="cart_link">KOSÁRBA</a>{/if}
                </div>
              </div>
              
              {if $smarty.foreach.main.index%3==0 && $smarty.foreach.main.index!==0 || $smarty.foreach.main.index==1 || $smarty.foreach.main.last}
              <br class="clear" />
              {/if}
                            

            {if $smarty.foreach.main.index==1 || $smarty.foreach.main.index%2==1 && $smarty.foreach.main.index!==0  || $smarty.foreach.main.last}
            </div>
            {/if}

           {/foreach}         
          </div>
          
          <div class="bottom"></div>
        </div>
        <!--news stuff box ends here-->


{include file='footer.tpl'}
