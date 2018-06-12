       <div class="news_list_page">
          <div class="top"><h2>Talált szolgáltatások</h2></div>
           {if ($tszol!="X")}
          <div class="repeat">
{foreach name=articles from=$tszol item=article}    

            <div class="item last">
              <h2><a href="{$article.filename}.html">{$article.title}</a></h2>
              <p class="date">{$article.artdate}</p>
              
	{if $article.image!=false}
        <img src="{#pt#}upload/articles/{$article.image}&w=64" width="64" alt="{$article.imgalt}" title="{$article.imgtitle}" />	
 {else}
              <img src="images/pic2.gif" alt="" width="64" heigth="64" title="" />
{/if}			  							

              
              <div class="text_container">
                <p><b>{$article.intro|nl2br}</b></p>
                
                <a href="{$article.filename}.html" title="" class="more">TOVÁBB</a>
                <br class="clear" />
              </div>
              <br class="clear" />
            </div>
  {/foreach}					          
            <br class="clear" />
            </div>           
{else}
<div class="repeat">
  <div class="item last">
    <p> Nem találtam a keresésnek megfelelő szolgáltatást</p>
  </div>
</div>
{/if} 	    
          
          <div class="bottom">
            {assign var='pagerEntity' value='szolgáltatás'}
	    {assign var='total' value=$xtsz}
	    {include file='pager.tpl'}
	  </div>

</div>
