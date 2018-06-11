{include file='header.tpl'}

        <div id="main">
					<div id="navigationBar">
						<a href="{$mainFilename}">Főoldal</a>
						{if !$actualList}
						<h1>Segítség termékkiválasztáshoz</h1>
            {else}
            <a href="{$categoryFilename}">Segítség termékkiválasztáshoz</a>
            <h1>{$actualList}</h1>
            {/if}						
					</div>
					
					<h2>Csoportok</h2>
					<p>Kérjük, válasszon az alábbi kategóriák közül!</p>
					<div class="column3 menu">
					  <ul>
              {assign var=isgroup value=0}
					    {foreach from=$column1 item=row}                            
                {if $isgroup==0 && $row.isgroup!=false}                  
                  {assign var=isgroup value=1}
                  <p>{$row.isgroup}</p>
                  <ul>
                {/if}
                {if $isgroup==1 && $row.isgroup==false}
                  </ul></li>
				  {assign var=isgroup value=0}
                {/if}
							  <li><a href="{$row.filename}">{$row.title}</a></li>                                
						  {/foreach}
						</ul>
						<ul>
              {assign var=isgroup value=0}
					    {foreach from=$column2 item=row}                            
                {if $isgroup==0 && $row.isgroup!=false}                  
                  {assign var=isgroup value=1}
                  <li><p>{$row.isgroup}</p>
                  <ul>
                {/if}
                {if $isgroup==1 && $row.isgroup==false}
                  </ul></li>
				  {assign var=isgroup value=0}
                {/if}
							  <li><a href="{$row.filename}">{$row.title}</a></li>                                
						  {/foreach}
						</ul>
						<ul>
						  {assign var=isgroup value=0}
					    {foreach from=$column3 item=row}                            
                {if $isgroup==0 && $row.isgroup!=false}                  
                  {assign var=isgroup value=1}
                  <p>{$row.isgroup}</p>
                  <ul>
                {/if}
                {if $isgroup==1 && $row.isgroup==false}
                  </ul></li>
				  {assign var=isgroup value=0}
                {/if}
							  <li><a href="{$row.filename}">{$row.title}</a></li>                                
						  {/foreach}
						</ul>
					</div>

					
          <div id="informationBar">
						<p class="filteredProducts">Kiválasztott termék kategória: <span>{$actualList}</span></p>

						<p class="results">Találat: <span>{$total} tétel</span></p>
					</div>
					<div class="column2">
					    {foreach from=$products item=product}
							<div class="box">
								<h4><a href="{$product.filename}.html">{$product.title}</a></h4>								
                {if $product.image!==false}
                {if $product.discount!=0}
                  <div class="symbolSpecial"></div>
                {else}
                  {if $product.newproduct!=0}
                    <div class="symbolNew"></div>
                  {/if}
                {/if}
								<a title="{$product.title}" href="{$product.filename}.html"><img src="{#pt#}{$product.image}&h=120" alt="{$product.title}" title="{$product.title}" /></a>
                {/if}

								<p><strong>{$productCustomCategories[$product.customcategory].title}</strong><br />{$product.intro|nl2br}</p>
								<a class="inToTheBasket" href="{$cartFilename}?cartaction=add&id={$product.id}">Kosárba</a>
								<a class="more" href="{$product.filename}.html">részletek »</a>
							</div>
						{/foreach}
					</div>

          
					
				</div>
    
{include file='footer.tpl'}    
     
