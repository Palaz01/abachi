<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="hu" />
<title>Elfelejtett jelszó</title>
</head>
<body>
    <form action="password.php" method="post">
    <div style="height: 220px">    
    </div>
     <center>
        <table cellspacing="0" cellpadding="4" border="0" style="background-color:#E3EAEB;border-color:#E6E2D8;border-width:1px;border-style:Solid;border-collapse:collapse;">
	<tr>
		<td><table cellpadding="0" border="0" style="color:#333333;font-family:Verdana;font-size:0.8em;width:295px;">
			<tr>
				<td align="center" colspan="2" style="color:White;background-color:#1C5E55;font-size:0.9em;font-weight:bold;">Elfelejtett jelszó</td>
			</tr>
      <tr>
				<td align="right"><label for="username">Felhasználónév:</label></td><td><input name="username" id="username" type="text" class="admin-text" style="width: 120px;" value="{$username}" /></td>
			</tr>      
      <tr>
				<td align="right" colspan="2"><input type="submit" name="forgot" value="Küldés" class="admin-button" /></td>
			</tr>
			<tr>
				<td align="center" colspan="2" style="color:{$color};">{$msg}</td>
			</tr>
			<tr>
				<td colspan="2"><a style="color: #1c5e55;" href="admin.php">Bejelentkezéshez</a></td>
			</tr>
		</table></td>
	</tr>
</table>
     </center>
    
        </form>
</body>
</html>
