{include file='admin.header.tpl'}

{literal}
<script>
function checkForm() {
  var p1 = $('p1');
  var p2 = $('p2');
  var op = $('op');
    
  if (op.value == "") {
    alert ('Meg kell adnia régi (aktuális) jelszavát!');
    op.focus();
    return false;
  }
  else if (p1.value != p2.value) {
    alert ('A két beírt új jelszó nem egyezik meg!');
    p1.value = "";
    p2.value = "";
    p1.focus();
    return false;
  }
  else if (p1.value == "") {
    alert ('Kérem adja meg az új jelszót!');
    p1.focus();
    return false;
  }
  return true;
}
</script>
{/literal}


<div class="{$msgClass}">
{$message}
</div>

<form action="admin.php?mod=passchange" method="post">
<h3>Felhasználói adatok</h3>
<table>
  <tr>
    <td>
      Felhasználói név:
    </td>
    <td>      
      <input class="admin-text" type="text" name="username" value="{$username}" />	    
    </td>
  </tr>
    <tr>
    <td>
      E-mail cím:
    </td>
    <td>      
      <input class="admin-text" type="text" name="email" value="{$email}" />	       
    </td>
  </tr>
</table>

<input type="hidden" name="ispostback-nopw" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Felhasználói adatok tárolása" />
</div>
</form>

<br /><br /><br />

<form action="admin.php?mod=passchange" method="post" onsubmit="javascript: return checkForm();">
<h3>Jelszóváltoztatás</h3>
<table>
  <tr>
    <td>
      Régi jelszó:
    </td>
    <td>      
      <input class="admin-text" type="password" id="op" name="oldpw" value="" />	    
    </td>
  </tr>
  <tr>
    <td>
      Új jelszó:
    </td>
    <td>      
      <input class="admin-text" type="password" id="p1" name="newpw1" value="" />	    
    </td>
  </tr>
  <tr>
    <td>
      Új jelszó megerősítése:
    </td>
    <td>      
      <input class="admin-text" type="password" id="p2" name="newpw2" value="" />	    
    </td>
  </tr>
</table>

<input type="hidden" name="ispostback" value="true" />

<div style="text-align: center">
  <input type="submit" class="admin-button" name="store" value="Jelszó tárolása" />
</div>


</form>

{include file='admin.footer.tpl'}
