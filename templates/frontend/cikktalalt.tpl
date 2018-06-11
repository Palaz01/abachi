        <div class="news_list_page">
          <div class="top"><h2>Talált Hírek</h2></div>
          {if ($tcikk!="X")}
          <div class="repeat">
{foreach name=articles from=$tcikk item=article}    

            <div class="item last">
              <h2><a href="{$article.filename}.html">{$article.title}</a></h2>
              <p class="date">{$article.artdate}</p>
              
	{if $article.image!=false}
        <img src="{#pt#}{$article.image}&w=64" width="64" alt="{$article.imgalt}" title="{$article.imgtitle}" />	
 {else}
              <img src="images/pic1.gif" width="64" alt="" title="" />
{/if}			  							

              
              <div class="text_container">
                <p><b>{$article.intro|nl2br}</b></p>
                
                <a href="{$article.filename}.html" title="" class="more">
                  <span class="left"></span>
                  <span class="repeat">TOVÁBB</span>
                  <span class="right"></span>
                </a>
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
    <p> Nem találtam a keresésnek megfelelő cikket</p>
  </div>
</div>
{/if}         
	    
          
          <div class="bottom">
            {assign var='pagerEntity' value='cikk'}
	    {assign var='total' value=$xtc}
	    {include file='pager.tpl'}
	  </div>
  </div>
  
