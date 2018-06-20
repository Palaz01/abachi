       <div class="news_list_page">
          <div class="top">
            <h2>Talált aloldalak</h2>
            <div class="vodor"></div>
          </div>
           {if ($tstat!="X")}
          <div class="repeat">
{foreach name=articles from=$tstat item=article}    

            <div class="item last">
              <h2><a href="{$article.filename}.html">{$article.title}</a></h2>
              
              <div class="text_container">

                <p><b>{$article.description|nl2br}</b></p>
                
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
    <p> Nem találtam a keresésnek megfelelő oldalt</p>
  </div>
</div>
{/if} 	    
          
          <div class="bottom">
            {assign var='pagerEntity' value='aloldal'}
	    {assign var='total' value=$xsta}
	    {include file='pager.tpl'}
	  </div>

</div>
