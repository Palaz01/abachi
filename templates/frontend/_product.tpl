        {include file='header.tpl'}
        <!--product view page starts here-->
        <div class="product_view_page">
          <div class="top">
            <h2>{$data.title}</h2>
            <div class="vodor"></div>
          </div>
          
          <div class="container">
            <div class="product">
	            <a class="first" href="{$data.image}" rel="gallery" title="{$data.title}"><img class="first" border="0" width="228" src="{#pt#}{$data.image}&w=228&zc=1" alt="{$data.imgalt}" title="{$data.imgtitle}" hspace="5" vspace="5" /></a>
              
              <div class="text_container">
                <h3 class="productName">{$data.title}</h3>
              
                <p><b>A termék leírása:</b></p>             
                
                <div class="fck">
                  {$data.description}
      
                  <br /> 
                  {foreach from=$texts item=text}
                    <p>
                      {$text.description|nl2br}
                    </p>
                  {/foreach} 
                  <br /> 
                </div>
                
                
                <p><b>Termékváltozatok:</b></p>

                <table>
                {foreach from=$editions item=edition}
                  <tr>
                    <td align="left">{$edition.title_1}</td>
                    <td align="right">{if $edition.price!='0'}{$edition.price|commify:-1:',':'.'} Ft{/if}</td>
                    <td align="right">
                      {if $edition.price==0}
                      <input type="button" value="AJÁNLAT" onclick="javascript:document.location='{$contactFilename}';" />
                      {else}
      								<input type="button" value="Kosárba" border="0" title="Kosárba" alt="Kosárba" onClick="javascript:document.location='{$edition.addToCartFilename}';"/>
      								{/if}
      							</td>
                  </tr>
                {/foreach}
                </table> 
                <br />
                
                
                {if $manufacturerData.image!==false}
                  <a href="{$manufacturerData.filename}.html"><img src="{$manufacturerData.image}" width="128" alt="{$manufacturerData.imgalt}" title="{$manufacturerData.imgtitle}" border="0" /></a>
                {/if}
                <br /><br />
                
                <p class="manufacturer">A gyártó neve: <a href="{$manufacturerData.filename}.html">{$manufacturerData.title}</a></p>
                
                <div class="price_container">
                  <p class="big_price"><span><span>{if $data.price!='0'}<b>Ára:</b> {$data.price|commify:-1:',':'.'} Ft{/if}</span></span></p>
                  
                  <p class="raktar">{if $data.instock}Raktáron</font>{else}Nincs raktáron{/if}</p>

                  <div class="submit">
                    {if $data.price==0}
                    <input type="button" value="AJÁNLAT" onclick="javascript:document.location='{$contactFilename}';" />
                    {else}
                    <input type="submit" value="KOSÁRBA" {if $data.instock} onclick="javascript:document.location='{$data.addToCartFilename}';" {else} disabled {/if}/>
                    {/if}
                  </div>
                </div>              
              </div>
              <br class="clear" />
            </div>
            
            
            {if $images}
            {if $smarty.get.watermark!='1'}
            <div class="jquery_gallery_container">
              <div class="jquery_gallery">
                <ul style=" list-style-type: none">
                {foreach from=$images item=image}
                  <li><a href="upload/products/{$image.filename}" rel="gallery"><img style="border:none;" src="{#pt#}upload/products/{$image.filename}&h=107" alt="{$image.imgalt}" title="{$image.imgtitle}" height="107" /></a></li>
                {/foreach}
                </ul>
              </div>
            </div>
            {else}
            <div class="jquery_gallery_container">
              <div class="jquery_gallery">
                <ul style=" list-style-type: none">
                {foreach from=$images item=image}
                  <li><a href="{#pt#}upload/products/{$image.filename}&h=650&fltr[]=wmi|/images/vizjel2.png|C|100" rel="gallery"><img style="border:none;" src="{#pt#}upload/products/{$image.filename}&h=107" alt="{$image.imgalt}" title="{$image.imgtitle}" height="107" /></a></li>
                {/foreach}
                </ul>
              </div>
            </div>
            {/if}
            {/if}
            
            <!--opinions starts here-->

            
            {include file='comment1.tpl'}
            <!--write your opinion ends here-->
            
            
            <!--kapcsolodo termek starts here-->
            <div class="kapcsolodo_termek new_stuff_box">
              <div class="container">

              {if $hasonlo}
              <h2>KAPCSOLÓDÓ TERMÉKEK</h2>

               {foreach from=$hasonlo item=h}
              
                 <div class="product">
                  <img src="upload/products/{$h.image}" width="123" alt="{$h.imgalt}" title="{$h.imgtitle}" />
                 
                  <div class="text_container">
                    <h2><a href="{$h.filename}.html" title="{$h.title}">{$h.title}</a></h2>
                    
                    <p>{$h.description}</p>
                    
                    <p class="price"><span><span>{if $h.price!='0'}<b>Ára:</b> {$h.price} Ft{/if}</span></span></p>
                    
                    <a href="{$h.filename}.html" title="" class="details_link">RÉSZLETEK</a>
                    
                    {if $h.price==0}
                    <a href="{$contactFilename}" title="" class="cart_link">AJÁNLAT</a>
                    {else}
                    {if $h.instock}
                    <a href="{$h.addToCartFilename}.html" title="" class="cart_link">KOSÁRBA</a>
                    {/if}
                    {/if}
  
                    <br class="clear" />
                  </div>
                  <br class="clear" />
                </div>
              
               
               {/foreach}
               
               {/if}
                    
              <br class="clear" />        
            </div>
            </div>

            <!--kapcsolodo termek ends here-->            
          </div>
          
          <div class="bottom"><a href="/" title="">Vissza</a></div>
        </div>
        <!--product view page ends here-->




				
				


{include file='footer.tpl'}

    
