{include file='admin.header.tpl'}

<h3>Kapcsolatfelvétel adatai</h3>

<table>
  <tr>
    <td>
      Érkezett:
    </td>
    <td>
      <input class="admin-text" type="text" id="arrdate" value="{$arrdate}" style="width: 400px;" /><br />
    </td>
  </tr>
  <tr>
    <td>
      Név:
    </td>
    <td>
      <input class="admin-text" type="text" id="name" value="{$name}" style="width: 400px;" /><br />
    </td>
  </tr>
  <tr>
    <td>  
      E-mail:
    </td>
    <td>  
      <input class="admin-text" type="text" id="email" value="{$email}" style="width: 400px;" /><br />
    </td>
  </tr>  
  <tr>
    <td>  
      Telefonszám:
    </td>
    <td>  
      <input class="admin-text" type="text" id="telephone" value="{$telephone}" style="width: 400px;" /><br />
    </td>
  </tr>
  <tr>
    <td valign="top">
      Üzenet:
    </td>
    <td>
      <textarea style="width: 400px; height: 300px;" class="admin-text" id="message">{$message}</textarea>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <center>
        <input type="button" name="a" value="Vissza" class="admin-button" onclick="javascript: document.location='admin.php?mod=contactslist';" />
      </center>
    </td>
  </tr>
</table>

{include file='admin.footer.tpl'}
