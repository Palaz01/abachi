       <div class="news_list_page">
          <div class="top"><h2>Szolgáltatásaink</h2></div>
          
          <div class="repeat">
{foreach name=articles from=$articlesz item=article}    

            <div class="item{if $smarty.foreach.articles.last} last{/if}">
              <h2><a href="{$article.filename}.html">{$article.title}</a></h2>
              
	{if $article.image!=false}
        <a href="{$article.filename}.html"><img src="{#pt#}{$article.image}&w=123" width="123" alt="{$article.imgalt}" title="{$article.imgtitle}" /></a>
 {else}
              <a href="{$article.filename}.html"><img src="images/pic2.gif" alt="" width="123" height="123" title="" /></a>
{/if}			  							

              
              <div class="text_container">
                <p><b>{$article.intro|nl2br}</b></p>
                
                <a href="{$article.filename}.html" title="{$article.moretitle}" class="more">
                  <span class="left"></span>
                  <span class="repeat">{$article.morelink}</span>
                  <span class="right"></span>
                </a>
                <br class="clear" />
              </div>
              <br class="clear" />
            </div>
  {/foreach}					          
            <br class="clear" />
            </div>           
	    
          
          <div class="bottom">
            {assign var='pagerEntity' value='cikk'}
	    {include file='pager.tpl'}
	  </div>

</div>