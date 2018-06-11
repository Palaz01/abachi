{include file='header.tpl'}

        <!--detailed search page starts here-->
        <div class="detailed_search_page">
          <div class="top">
            <h2>Részletes keresés</h2>
            <div class="vodor"></div>  
          </div>
          
          <div class="repeat">
            <div class="search_icon"></div>
            
            <form name="advanced_search" action="{$searchResultsFilename}" method="post">
              <label>Keresett szöveg (terméknév)</label><br />
              <input type="text" name="searchpattern" />
              <hr class="divide first" />
              
              <p>Az alábbi listából akár többet is választhat CTRL + kattintással.</p>
              <br />
              
              
              <div class="float_left">
                <label>Gyártó(k)</label>
                
                <select name="manufacturer" multiple="multiple" size="10">
                  {html_options options=$manufacturersAvaiable}
                </select>
              </div>
              
              
              <div class="float_left">
                <label>Kategóriák</label>
                
                <select name="categories[]" multiple="multiple" size="10">
                  {html_options options=$categoriesAvailable}
                </select>
              </div>   
              <br class="clear" />           
              
              <hr class="divide" />
              
              <label>Érték</label>
              
              <div class="submit">
                <input type="text" name="minprice" value="" />
                <span>-tól</span>
                
                <input type="text" name="maxprice" value="" />
                <span>-ig</span>
                
                <input type="submit" value="KERESÉS" class="submit" />
                <br class="clear" />
              </div>
              
              <input type="hidden" name="dosearch" value="Keresés" />
            </form>
          </div>
          
          <div class="bottom"></div>          
        </div>
        <!--detailed search page ends here-->



		
{include file='footer.tpl'}
