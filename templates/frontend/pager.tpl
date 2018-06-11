            <div class="pager">
              <p>Összesen: {$total} {$pagerEntity}</p>

              {if $prev==true}
              <div class="prev_page">
                <a href="{$prevPage}" title="">[&laquo;&nbsp;Előző]</a>
              </div>
              {/if}

              <div>
                 {foreach from=$pages item=page}
		  &nbsp;
		  {if $page.current==true}
		      <b>{$page.caption}</b>
		    {else}          
		      <a href="{$page.filename}" class="pageResults" title="{$page.caption}. lap"><u>{$page.caption}</u></a>
		    {/if}
		    &nbsp;
		{/foreach}
              </div>
{if $next==true}  
              <div class="next_page">
                <a href="{$nextPage}" title="">[Következő&nbsp;&raquo;]</a>
              </div>
{/if}
            </div>
            <!--pager ends here-->
    
        
    