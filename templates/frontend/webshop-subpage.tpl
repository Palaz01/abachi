{include file='header.tpl'}

 <div class="new_stuff_box">
          <div class="top">
              <h2 class="title">SZAUNA AKCIÓ, ÚJDONSÁGOK</h2>
              <div class="vodor">
                  <img src="templates/images/dezsa.png" alt="Vödör">
              </div>
          </div>
          <div class="container">
          
          
            {if sizeof($productsOnMainpage)>2}
            <div class="item">
            {else}
            <div class="item nomargin noborder">
            {/if}
          
          {foreach from=$productsOnMainpage item=row name=main}
            
              <div class="product">
                 <div class="product-image-box">
                    <img src="{#pt#}{$row.image}&amp;w=432&amp;far=1" width="432" alt="{$row.imgalt}" title="{$row.imgtitle}" />
                 </div>
                  <div class="text_container">
                  <div>
                      <h2><a href="{$row.filename}.html" title="">{$row.title}</a></h2>

                      <p>{$row.description}</p>

                      <p class="price"><span><span>{if $row.finalprice!='0'}Ára: <b>{$row.finalprice|commify:-1:',':'.'} Ft</b>{/if}</span></span></p>
                  </div>
                  <div class="flex">
                      <a href="{$row.filename}.html" title="" class="details_link">RÉSZLETEK</a>
                      {if $row.finalprice==0}
                      <a href="{$contactFilename}" title="" class="cart_link">AJÁNLAT</a>
                      {else}
                      {if $row.instock}<a href="#" title="" onclick="javascript:document.location='{$row.addToCartFilename}.html';" class="cart_link">KOSÁRBA</a>{/if}
                      {/if}
                  </div>
                </div>
              </div>
              
              {if ($smarty.foreach.main.index+1)%2==0}
              
                <br class="clear" />
                </div>
                
                {if $smarty.foreach.main.index+1<sizeof($productsOnMainpage)-2}
                  <div class="item">
                {else}
                  <div class="item nomargin noborder">
                {/if}               
              
              {/if}
              


           {/foreach}
           
           <br class="clear" /> 
           </div>
                    
          </div>
          
          <div class="bottom"></div>
        </div>
        <!--news stuff box ends here-->


{include file='footer.tpl'}
