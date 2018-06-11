<table>
  <tr>
    <td valign="top">
      <table>
        <tr>
          <td>Kategória:</td>
          <td>
            <div id="myproductselector_category_div">
              <select>
                <option value="*">Kérem várjon...</option>
              </select>
            </div>
          </td>    
        </tr>
        <tr>
          <td>Termék:</td>
          <td>
            <div id="myproductselector_product_div">
              <select>
                <option value="*">---</option>
              </select>
            </div>
          </td>
        </tr>
        {if $productSelectorHasEdition==true}
        <tr>
          <td>Termékváltozat:</td>
          <td>
            <div id="myproductselector_edition_div">
              <select>
                <option value="*">---</option>
              </select>
            </div>
          </td>
        </tr>
        {/if}
      </table>
    </td>
    <td valign="top">
      <select class="admin-select" name="myproductselector_selected_products" id="myproductselector_selected_products" size="10" style="height: 80px; width: 300px;">
         {html_options options=$productsDefaultOptions}
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <center>
        <input type="button" name="myproductselector_add_product" value="Termék hozzáadása" class="admin-button" onclick="javascript: addProduct()" />
        &nbsp;&nbsp;&nbsp;
        <input type="button" name="myproductselector_rem_product" value="Kijelölt termék törlése" class="admin-button" onclick="javascript: removeProduct()" />
        {if $productSelectorHasSorter==true}
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="myproductselector_up_product" value="Felfelé mozgat" class="admin-button" onclick="javascript: moveUp()" />
        &nbsp;&nbsp;&nbsp;
        <input type="button" name="myproductselector_down_product" value="Lefelé mozgat" class="admin-button" onclick="javascript: moveDown()" />
        {/if}
      </center>
    </td>
  </tr>
</table>  

<input type="hidden" name="products" id="products" value="" />

<script type="text/javascript">

var hasEdition = 0;
if ({$productSelectorHasEdition}) hasEdition = 1;

{literal}
function loadCategory() {
  var ajax = new Ajax.Updater(
   {success: 'myproductselector_category_div'},
   'admin-ajax.php',
   {method: 'get', parameters: 'categoryquery=1'}
  );
  clearDiv("product");
  if (hasEdition == 1) { clearDiv("edition"); }
}

function updateProducts() {
  var cat = $('myproductselector_category').value;
  if (cat == '*') { return; }
  var ajax = new Ajax.Updater(
   {success: 'myproductselector_product_div'},
   'admin-ajax.php',
   {method: 'get', parameters: 'category='+cat+'&hasedition='+hasEdition}
  );
  if (hasEdition == 1) { clearDiv("edition"); }
}

function updateEditions() {
  if (hasEditions==0) { return; }
  var cat = $('myproductselector_product').value;
  if (cat == '*') { return; }
  var ajax = new Ajax.Updater(
   {success: 'myproductselector_edition_div'},
   'admin-ajax.php',
   {method: 'get', parameters: 'product='+cat}
  );
}

function clearDiv(divname) {
  $('myproductselector_'+divname+'_div').innerHTML = '<select><option value="*">---</option></select>';
}

function addProduct() {
  if ($('myproductselector_product') == null) {
    alert ('Kérem válassza ki a listához adandó terméket a bal oldali legördülő listák segítségével!'); 
    return; 
  }
  var sel=$('myproductselector_selected_products');
  var prod=$('myproductselector_product');
  
  
  
  if (prod.value=='*') {
    alert ('Kérem válassza ki a listához adandó terméket a bal oldali legördülő listák segítségével!');
    return;
  }
  
  if (hasEdition == 1) {    
    var ed=$('myproductselector_edition');
    if (ed.value=='*') {
      alert ('Kérem válassza ki a listához adandó termék termékváltozatát a bal oldali legördülő listák segítségével!');
      return;
    }
  }
  
  var newvalue = prod.options[prod.selectedIndex].value;
  if (hasEdition == 1) {
    if (ed.value!='!') {
      newvalue += '-' + ed.options[ed.selectedIndex].value;
    }
  }
  var newtext = prod.options[prod.selectedIndex].text;
  if (hasEdition == 1) {
    if (ed.value!='!') {
      newtext += ' (' + ed.options[ed.selectedIndex].text + ')';
    }
  }
  
  for (var i=0;i<sel.options.length;i++) {
    if (sel.options[i].value == newvalue) {
      alert ('A termék már szerepel a listán!'); 
      return; 
    }
  }
  
  sel.options[sel.options.length] = new Option(newtext, newvalue);
}

function removeProduct() {
  var sel=$('myproductselector_selected_products');
  
  if (sel.selectedIndex == -1) { return; }
  
  sel.remove(sel.selectedIndex);
}

function populateHidden() {
  var sel=$('myproductselector_selected_products'); var ret=''; var first=true;
  for (var i=0;i<sel.options.length;i++) {
    if (!first) { ret += '|'; }
    ret += sel.options[i].value;
    first=false;
  }
  $('products').value = ret;
}

function moveCheck() {
  var sel=$('myproductselector_selected_products');
  if (sel.selectedIndex==-1) { 
    alert('Mozgatás előtt jelölje ki a mozgatandó elemet a jobb oldali listában!');
    return false;
  }
  return true;
}

function moveUp() {
  if (!moveCheck()) { return; }
  
  var sel=$('myproductselector_selected_products');
  var now = sel.selectedIndex;
  if (now == 0) { return; }
  
  var oldValue = sel[now-1].value;
  var oldText = sel[now-1].text;
  var newValue = sel[now].value;
  var newText = sel[now].text;
  sel[now-1].value = newValue;
  sel[now-1].text = newText;
  sel[now].value = oldValue;
  sel[now].text = oldText;
  sel.selectedIndex = now-1;    
}

function moveDown() {
  if (!moveCheck()) { return; }
  
  var sel=$('myproductselector_selected_products');
  var now = sel.selectedIndex;
  if ((now+1) == sel.options.length) { return; }
  
  var oldValue = sel[now+1].value;
  var oldText = sel[now+1].text;
  var newValue = sel[now].value;
  var newText = sel[now].text;
  sel[now+1].value = newValue;
  sel[now+1].text = newText;
  sel[now].value = oldValue;
  sel[now].text = oldText;
  sel.selectedIndex = now+1;
}

loadCategory();
</script>
{/literal}
