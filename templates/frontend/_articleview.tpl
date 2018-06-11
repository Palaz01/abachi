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
              <img src="{#pt#}{$data.image}&w=265" width="265" alt="{$data.imgalt}" title="{$data.imgtitle}" class="first"/>
            {/if}
                        
            <p class="date">{$data.artdate}</p>
            
            <p>

              <b>{$data.intro|nl2br}</b><br/><br/>
               {$data.content}
            </p>
            <br class="clear" />
            
            {if $similarArticles}
           <br/> <br/> <br/> <br/>
            <p class="hasonlo_cikkek">            
              <strong>További hasznos tudnivalók:</strong>
            </p>
            
            <ul class="hasonlo_cikkek">
            {foreach from=$similarArticles item=article}
              <li><a href="{$article.filename}{#ext#}" title="{$article.title}">{$article.title}</a></li>
            {/foreach}
            </ul>
            {/if}
            

                    
        <br/><br/><br/><br/>
          <!--gallery starts here-->
        {if $images}
        <div class="jquery_gallery_container">
          <div class="jquery_gallery">
            <ul style=" list-style-type: none">
            {foreach from=$images item=image}
              <li><a href="upload/articles/{$image.filename}" rel="gallery"><img style="border:none;" src="{#pt#}upload/articles/{$image.filename}&amp;h=107" alt="{$image.imgalt}" height="107" title="{$image.imgtitle}" /></a></li>
            {/foreach}
            </ul>
          </div>
        </div>
        {/if}

           
         {include file="comment.tpl"}   
            
           
          </div>
          
          <div class="bottom"><a href="{$backFilename}">Vissza</a></div>
        </div>
        <!--news view page ends here--> 

