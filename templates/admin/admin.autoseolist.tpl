{include file='admin.header.tpl'}

<div class="pageTitle">
  <h3>AutoSEO javaslatai</h3>
</div>
<br />

{if sizeof($messages) != 0}
<div class="{$msgClass}">
{$messages}
</div>
{/if}

{if sizeof($res)==0}

{else}

<form action="{$formaction}" method="post" id="form">
  <table class="maingrid">
    <tr>      
      <th>Tartalom</th>
      <th>Érintett mezők</th>
      <th>&nbsp;</th>
      <th>&nbsp;</th>
    </tr>
    {foreach from=$res item=row name=main}
    
      {assign var='tdClass' value='odd'}
      {if $smarty.foreach.main.index%2==0}{assign var='tdClass' value='even'}{/if}
    
      <tr id="general-{$row.id}">
        <td class="{$tdClass}"><a href="{$row.url}" title="" target="_blank" style="color: #000;">{$row.helpertitle}</a></td>
        <td class="{$tdClass}">{$row.cnt} ({$row.fieldlist})</td>
        <td class="{$tdClass}">
          <input type="button" name="showdetails{$row.id}" value="Részletek" class="admin-button" onclick="javascript: document.getElementById('details-{$row.id}').style.display='';" />
        </td>
        <td class="{$tdClass}">
          <input type="radio" id="sa-{$row.id}-all" name="a-{$row.id}-all" value="1" onclick="javascript: setAll('ret-{$row.id}', '1');" />
          <label for="sa-{$row.id}-all">Elfogad</label>
          <br />
          <input type="radio" id="da-{$row.id}-all" name="a-{$row.id}-all" value="0" onclick="javascript: setAll('ret-{$row.id}', '0');" />
          <label for="da-{$row.id}-all">Elutasít</label>
        </td>
      </tr>    
      <tr id="details-{$row.id}" style="display: none;">
        <td colspan="4">
          <table>
            </tr>
              <td>
                <table>
                  <tr>
                    <th>Mező</th>
                    <th>Régi</th>
                    <th>Javasolt</th>
                    <th>&nbsp;</th>
                  </tr>
                  {foreach from=$row.fields item=field}
                    <tr>
                      <td>{$field.field}</td>
                      <td>{$field.originalcontent}</td>
                      <td>
                        <div id="show-{$field.metaid}-{$field.field}">
                          <a id="link-{$field.metaid}-{$field.field}" href="#" onclick="javascript: startEdit('{$field.metaid}-{$field.field}'); return false;" style="color: #000;">{$field.proposedcontent|htmlspecialchars}</a>
                        </div>
                        <div id="edit-{$field.metaid}-{$field.field}" style="display: none;">
                          <input type="text" id="newvalue-{$field.metaid}-{$field.field}" value="{$field.proposedcontent|htmlspecialchars}" class="admin-text" style="width: 250px;" />
                          <input type="button" name="save-{$field.metaid}-{$field.field}" id="savebutton-{$field.metaid}-{$field.field}" class="admin-button" value="Mentés" onclick="javascript: ajaxSave('{$field.metaid}-{$field.field}');" />
                          <input type="button" name="cancel-{$field.metaid}-{$field.field}" class="admin-button" value="Mégsem" onclick="javascript: cancelEdit('{$field.metaid}-{$field.field}');" />
                
                        </div>
                      </td>
                      <td>
                        <input type="radio" id="accept-{$field.metaid}-{$field.field}" name="ret-{$field.metaid}-{$field.field}" value="1" />
                        <label for="accept-{$field.metaid}-{$field.field}">Elfogad</label>
                        <br />
                        <input type="radio" id="decline-{$field.metaid}-{$field.field}" name="ret-{$field.metaid}-{$field.field}" value="0" />
                        <label for="decline-{$field.metaid}-{$field.field}">Elutasít</label>
                      </td>
                    </tr>
                  {/foreach}
                </table>
              </td>
              <td>
                <input type="button" name="cancel-{$row.id}" class="admin-button" value="Elrejt" onclick="javascript: document.getElementById('details-{$row.id}').style.display='none';"  />
              </td>
            </tr>
          </table>
          
        </td>
      </tr>
      
    {/foreach}
  </table>
  <br />
  
  <center>
    <input type="button" name="decall" class="admin-button greyButton" value="Mind elfogad" onclick="javascript: acceptAll();" />
    &nbsp;&nbsp;
    <input type="button" name="accall" class="admin-button greyButton" value="Mind elutasít" onclick="javascript: declineAll();" />
  </center>
  
    <br />  <br /> 
  
  
  <center>
    <input type="submit" name="savevalues" class="admin-button orangeButton" value="Mentés" onclick="javascript: return confirm('Biztos, hogy menteni akarja a táblázatban megadottakat?');" />
  </center>
</form>

<br />
<br />
<br />

<table border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td>
      {include file='admin.my.control.navbutton.tpl'}      
    </td>
  </tr>
</table>

{literal}
<script type="text/javascript">
var http_request = false; 
function xmlhttpPost(strURL) {
  if (window.XMLHttpRequest) {
    http_request = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    http_request = new ActiveXObject("Microsoft.XMLHTTP");
  }
  http_request.open('POST', strURL, true);
  http_request.onreadystatechange = finalizeAjaxSave;
  http_request.send(null); 
}
function setAll(startwith, newvalue) {
  var formElements = document.getElementById("form").elements;
  
  for (var i = 0; i < formElements.length; i++) {
    var formElement = formElements.item(i);
    if (formElement.type === "radio") {
      if (formElement.name.indexOf(startwith) == 0) {
        if ((formElement.id.indexOf('accept') != -1) && (newvalue == '1')) {
          formElement.checked = true;
        }
        if ((formElement.id.indexOf('decline') != -1) && (newvalue == '0')) {
          formElement.checked = true;
        }
      }    
    }
  }
}
function startEdit(id) {
  var showdiv = document.getElementById('show-'+id);
  var editdiv = document.getElementById('edit-'+id);
  showdiv.style.display = 'none';
  editdiv.style.display = 'block';
}
function cancelEdit(id) {
  var showdiv = document.getElementById('show-'+id);
  var editdiv = document.getElementById('edit-'+id);
  showdiv.style.display = 'block';
  editdiv.style.display = 'none';
}
function ajaxSave(id) {
  var txt = document.getElementById('newvalue-'+id);
  var link = document.getElementById('link-'+id);
  
  var btn = document.getElementById('savebutton-'+id);
  btn.disabled = 'disabled';
  
  finId = id;
  xmlhttpPost ('admin.php?mod=autoseolist&cmd=ajax&target=' + id + '&value=' + txt.value);
}
var finId = '';
function finalizeAjaxSave() {
  var link = document.getElementById('link-'+finId);
  var txt = document.getElementById('newvalue-'+finId);
  var btn = document.getElementById('savebutton-'+finId);
  
  var strtoshow = txt.value;
  strtoshow = strtoshow.replace(/&/g,"&amp;");
  strtoshow = strtoshow.replace(/\"/g,"&quot;");
  strtoshow = strtoshow.replace(/\'/g,"&#039;");
  strtoshow = strtoshow.replace(/</g,"&lt;");
  strtoshow = strtoshow.replace(/>/g,"&gt;");
  
  link.innerHTML = strtoshow;
  
  cancelEdit(finId);
  btn.disabled = '';
}
function acceptAll() {
  {/literal}
  {foreach from=$res item=row}
  document.getElementById('sa-{$field.metaid}-all').checked = true;
  {foreach from=$row.fields item=field}
  setAll('ret-{$field.metaid}-{$field.field}', '1');
  {/foreach}
  {/foreach}
  {literal}
}
function declineAll() {
  {/literal}
  {foreach from=$res item=row}
  document.getElementById('da-{$field.metaid}-all').checked = true;
  {foreach from=$row.fields item=field}
  setAll('ret-{$field.metaid}-{$field.field}', '0');
  {/foreach}
  {/foreach}
  {literal}
}

</script>
{/literal}

{/if}




{include file='admin.footer.tpl'}