        {include file='header.tpl'}
        <!--product view page starts here-->
        <div class="product_view_page" itemscope itemtype="http://schema.org/product">
          
          <div class="top">
            <h2>{$data.title}</h2>
            <div class="ful"></div>
          </div>
          <div class="container">
            <div class="product">
              <div class="product_info_left">
                <a class="first" href="{#pt#}{$data.image}&h=650&fltr[]=wmi|/images/vizjel2.png|C|100" rel="gallery" title="{$data.title}">
                    <!--<img class="first" border="0" width="228" src="{#pt#}{$data.image}&w=228&zc=1" alt="{$data.imgalt}" title="{$data.imgtitle}" hspace="5" vspace="5" {if !$data.defaultimage}itemprop="image"{/if} />-->
                    <img class="first" border="0" width="228" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" alt="{$data.imgalt}" title="{$data.imgtitle}" hspace="5" vspace="5" {if !$data.defaultimage}itemprop="image"{/if} />
                </a>

                  <div class="jquery_gallery_container">
                      <div class="jquery_gallery">
                          <ul style=" list-style-type: none">
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                              <li><a href="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000" rel="gallery"><img style="border:none;" src="https://www.leitrimobserver.ie/resizer/750/563/true/1493998017109.jpg--kilkenny_sees_sunshine_at_last_.jpg?1493998018000"/></a></li>
                          </ul>
                      </div>
                  </div>



                <!--{if $images}
                  <div class="jquery_gallery_container">
                    <div class="jquery_gallery">
                      <ul style=" list-style-type: none">
                        {foreach from=$images item=image}
                          <li><a href="{#pt#}upload/products/{$image.filename}&h=650&fltr[]=wmi|/images/vizjel2.png|C|100" rel="gallery"><img style="border:none;" src="{#pt#}upload/products/{$image.filename}&h=107" alt="{$image.imgalt}" title="{$image.imgtitle}" height="107" /></a></li>
                        {/foreach}
                      </ul>
                    </div>
                  </div>
                {/if}-->
                <p class="manufacturer">A gyártó neve: <a href="{$manufacturerData.filename}.html" title="" itemprop="brand">{$manufacturerData.title}</a></p>
                {if $manufacturerData.image!==false}
                  <a href="{$manufacturerData.filename}.html"><img src="{$manufacturerData.image}" width="128" alt="{$manufacturerData.imgalt}" title="{$manufacturerData.imgtitle}" border="0" /></a>
                {/if}
                <br>
              </div>
              <div class="text_container">
                <h3 class="productName" itemprop="name">{$data.title}</h3>
                {if $edition.price==0}
                  <input type="button" value="AJÁNLAT" onclick="javascript:document.location='{$contactFilename}';" />
                {else}
                  <input type="button" value="Kosárba" border="0" title="Kosárba" alt="Kosárba" onClick="javascript:document.location='{$edition.addToCartFilename}';"/>
                {/if}
                <p><b>A termék leírása:</b></p>             
                
                <div class="fck" itemprop="description">
                  {$data.description}
      
                  <br /> 
                  {foreach from=$texts item=text}
                    <p>
                      {$text.description|nl2br}
                    </p>
                  {/foreach} 
                  <br /> 
                </div>

                <div class="price_container">
                  <div>
                    <p><b>Termékváltozatok:</b></p>

                    <table>
                        {foreach from=$editions item=edition}
                        <tr>
                          <td align="left">{$edition.title_1}</td>
                          <td align="right">{if $edition.price!='0'}{$edition.price|commify:-1:',':'.'} Ft{/if}</td>
                        </tr>
                        {/foreach}
                    </table>
                    <br />
                  </div>
                  <div>
                    <p class="big_price">{if $data.price!='0'}Ára: {$data.price|commify:-1:',':'.'} Ft{/if}</p>
                    <div class="submit">
                        {if $edition.price==0}
                        <input type="submit" value="AJÁNLAT" onclick="javascript:document.location='{$contactFilename}';" />
                        {else}
                        <input type="submit" value="Kosárba" border="0" title="Kosárba" alt="Kosárba" onClick="javascript:document.location='{$edition.addToCartFilename}';"/>
                        {/if}
                    </div>
                  </div>
                </div>
              </div>
              <br class="clear" />
            </div>
                
                

                <!-- ORIGINAL PRICE CONTAINER -->

                <!--<div class="price_container">
                  <div>
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
                  </div>
                  <div>
                    <p class="big_price"><span><span>{if $data.price!='0'}<b>Ára:</b>{$data.price|commify:-1:',':'.'} Ft{/if}</span></span></p>

                    <!--<p class="raktar">{if $data.instock}Raktáron{else}Nincs raktáron{/if}</p>-->

                    <!--<div class="submit">
                      {if $data.price==0}
                      <input type="button" value="AJÁNLAT" onclick="javascript:document.location='{$contactFilename}';" />
                      {else}
                      <input type="submit" value="KOSÁRBA" {if $data.instock} onclick="javascript:document.location='{$data.addToCartFilename}';" {else} disabled {/if}/>
                      {/if}
                    </div>
                  </div>
                </div>              
              </div>
              <br class="clear" />
            </div>-->
            
            {if $data.price!=0} 
            <span itemprop="offers" itemscope itemtype="http://schema.org/Offer">
            <meta itemprop="price" content="{$data.price}" />
            <meta itemprop="priceCurrency" content="HUF" /> 
            </span>
            {/if}  

            
            <!--opinions starts here-->

            
            {include file='comment1.tpl'}
            <!--write your opinion ends here-->
            </div>
           <div class="bottom"><a href="/" title="">Vissza</a></div>
        </div>
        <!--product view page ends here-->
            
        <!--kapcsolodo termek starts here-->
        <div class="kapcsolodo_termek new_stuff_box">
          <div class="container">
          {if $hasonlo}
          <div class="top">
            <h2>KAPCSOLÓDÓ TERMÉKEK</h2>
          </div>
           <div class="flex">
           {foreach from=$hasonlo item=h}
             <div class="product">
              <div class="product_image">
                <img src="upload/products/{$h.image}" width="123" alt="{$h.imgalt}" title="{$h.imgtitle}" />
              </div>
                 <div class="text_container">
                <h2><a href="{$h.filename}.html" title="{$h.title}">{$h.title}</a></h2>

                <p>{$h.description}</p>

                <p class="price"><span><span>{if $h.price!='0'}<b>Ára:</b> {$h.price} Ft{/if}</span></span></p>
                <div class="flex">
                    <a href="{$h.filename}.html" title="" class="details_link">RÉSZLETEK</a>

                    {if $h.price==0}
                    <a href="{$contactFilename}" title="" class="cart_link">AJÁNLAT</a>
                    {else}
                    {if $h.instock}
                    <a href="{$h.addToCartFilename}.html" title="" class="cart_link">KOSÁRBA</a>
                    {/if}
                    {/if}
                </div>
              </div>
            </div>


           {/foreach}

           {/if}
           </div>

        </div>
        </div>

        <!--kapcsolodo termek ends here-->





				
				


{include file='footer.tpl'}

    
