{include file='header.tpl'}
<div class="static_page">
          <div class="top">
            <h2>{$data.title}</h2>
          </div>
          
          <div class="repeat">
            <p>{if $data.image!=false}
        
  				  {if $manufacturerData.image!==false}
              <img src="{#pt#}{$data.image}&w=100" width="100" alt="{$data.imgalt}" title="{$data.imgtitle}" />
            {/if}
            {/if}</p>
            <p>{$data.description}</p> <br/>
  	        <a href="{$data.filename}.html"><b>{$data.title} termékei</b></a>
            <p>&nbsp;</p>
          </div>
          <div class="bottom"><a href="/" title="">Vissza</a></div>
        </div>

{include file='footer.tpl'}    
