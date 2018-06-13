{include file='header.tpl'}
<div class="static_page">
  <div class="top">
    <h2>{$data.title}</h2>
  </div>
  
  <div class="repeat">
    {if $images&&sizeof($images)!=0}
    <div class="masonry">
      {foreach from=$images item=image}
        <div class="item col3">
          <a href="{#pt#}upload/page/{$image.filename}&amp;h=650&amp;fltr[]=wmi|/images/vizjel2.png|C|100" rel="gallery"><img src="{#pt#}upload/page/{$image.filename}&w=200" alt="{$image.imgalt}" title="{$image.imgtitle}" width="200" /></a>
        </div>
      {/foreach}
           
      <br class="clear" />
    </div>
    {/if}

      
    <div class="fck">
      {$data.description}
    </div>
  </div>
  

             
  
  <div class="bottom"><a href="/" title="">Vissza</a></div>
</div>
        <!--static page ends here-->
{include file='footer.tpl'}    
