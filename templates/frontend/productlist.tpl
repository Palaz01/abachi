{include file='header.tpl'}
        <div class="product_list_page">
          <div class="top">
            {if ($talalva=="1")}
              <h2>Talált termékek</h2>
            {else}
              <h2>{if !isset($categoryData)}Terméklista{else}{$categoryData.title}{/if}</h2>
            {/if}
          </div>
          
          <div class="container">
            <p class="product"><a href="{$titleOrderLink}" style="text-decoration:none">Termék neve {if $lastChar==''}<img src="/images/up1.png" border="0" style="border:none; text-decoration:none;" align="absmiddle" />{/if}{if $lastChar=='a'}<img src="/images/down1.png" border="0" style="border:none; text-decoration:none;" align="absmiddle" />{/if}</a></p>
            <p class="manufacturer">Gyártó</p>
            <p class="price"><a href="{$priceOrderLink}" style="text-decoration:none">Bruttó ár{if $lastChar=='b'}<img src="/images/up1.png" border="0" style="border:none; text-decoration:none;" align="absmiddle" />{/if}{if $lastChar=='c'}<img src="/images/down1.png" border="0" style="border:none; text-decoration:none;" align="absmiddle" />{/if}</a></p>
            <p class="buy">Megveszem</p>

            <br class="clear" />
            
            
              <table cellpadding="0" cellspacing="0">
                <tbody>
 {foreach from=$data item=product}
	
     {assign var='trClass' value=''}	
     {if $smarty.foreach.main.index%2==0}{assign var='trClass' value='class="even"'}{/if}

                  <tr {$trClass}>
                    <td class="image"><a href="{$product.filename}.html"><img src="{#pt#}{$product.image}&w=119" width="119" border="0" alt="{$product.imgalt}" title="{$product.imgtitle}"></a></td>
                    <td class="product"><a href="{$product.filename}.html">{$product.title}</a></td>
                    <td class="manufacturer"><a href="{$product.manufacturerurl}.html">{$product.manufacturer}</a></td>

                    <td class="price">
                    
      {if $product.price!=0||$product.priced!=0}              
      {if $product.priced != 0}
         {$product.price|commify:-1:',':'.'} helyett {$product.priced|commify:-1:',':'.'} Ft
       {else}
         {$product.price|commify:-1:',':'.'} Ft
	    {/if}
	    {/if}
      
      </td>
	                  
	                  
                    {if $product.price==0}
                    <td class="buy"><input class="submit" type="button" value="AJÁNLAT" onclick="javascript:document.location='{$contactFilename}';" /></td>
                    {else}
                    <td class="buy"><input class="submit" {if !$product.instock}disabled="disabled"{/if} type="submit" value="KOSÁRBA" onclick="javascript:document.location='{$product.addToCartFilename}.html';" /></td>
                    {/if}
                  </tr>
             {/foreach}     
                  
                </tbody>
              </table>
            </div>
          
{assign var='pagerEntity' value='termék'}



          <div class="bottom">
            {include file='pager.tpl'}
            </div>
            <!--pager ends here-->          

        </div>
        <!--product list page ends here-->



					
				
{if ($talalva=="1")}

{include file='cikktalalt.tpl'}

{include file='szolgtalalt.tpl'}

{include file='stattalalt.tpl'}
{include file='footer2.tpl'}    
{else}
{include file='footer.tpl'}    
{/if}
    

