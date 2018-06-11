      <div class="news_view_page">
          <div class="top">
            <h2>{$data.title}</h2>
            <div class="vodor"></div>
          </div>

          
          <div class="repeat">
            <div class="links">
              <a href="#" title="" class="print"></a>
              <a href="#" title="" class="email"></a>
            </div>
            
            {if $data.image}
              <img class="first" src="{#pt#}{$data.image}&amp;w=265" width="265" alt="{$data.imgalt}" title="{$data.imgtitle}" />
            {/if}

            
            <p>
              <br />
              <b> {$data.intro|nl2br}</b><br/>
               {$data.content}
            </p>
            
            
            <br class="clear" />
            {if $images}
           <!--gallery starts here-->
	  <div class="jquery_gallery_container">
          <div class="jquery_gallery">
            <ul>
              
            {foreach from=$images item=image}
              <li><a href="upload/articles/{$image.filename}" rel="gallery"><img src="{#pt#}upload/articles/{$image.filename}&amp;h=107" alt="{$image.imgalt}" title="{$image.imgtitle}" height="107" /></a></li>
            {/foreach}
            </ul>
          </div>
        </div>
{/if}
            
            
            {if $similarArticles}
              <br/><br/><br/><br/>
           <p class="hasonlo_cikkek">            
              <strong>Kapcsolódó szolgáltatások:</strong>
            </p>
            
            <ul class="hasonlo_cikkek">
            {foreach from=$similarArticles item=article}
              <li><a href="{$article.filename}{#ext#}" title="{$article.title}">{$article.title}</a></li>
            {/foreach}
            </ul>
            {/if}
            

                    
        <br/><br/><br/><br/>

      </div> 
           
          
          <div class="bottom"><a href="{$szolg}" title="">Vissza</a></div>
        </div>
        <!--news view page ends here-->             
       
        