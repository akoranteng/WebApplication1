<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Limit Characters in a Multiline TextBox</title>
    <link href="../CSS/Demos.css" rel="stylesheet" type="text/css" />
    <script type='text/javascript' 
        src='../Scripts/jquery-1.3.2.min.js'>
    </script>
    
    <script type="text/javascript">
        $(function() {
            var limit = 50;
            var $tb = $('textarea[id$=tb1]');
            $tb.keyup(function() {
                var len = $(this).val().length;
                if (len > limit) {
                    $(this).addClass('exceeded');
                    $('#spn').text(len - limit + " characters exceeded");
                }
                else {
                    $(this).removeClass('exceeded');
                    $('#spn').text(limit - len + " characters left");
                }
            });

            $('input[id$=btnSubmit]').click(function(e) {
                var len = $tb.val().length;
                if (len > limit) {
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="smallDiv">
        <h2>Type into this textbox which accepts 50 characters overall</h2>
        <asp:TextBox ID="tb1" runat="server" TextMode="MultiLine" OnTextChanged="tb1_TextChanged"/><br /> 
        (This textbox accepts only 50 characters) <br />
        <span id="spn"></span>  <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit"/>
        <span id="error"></span>
        <br /><br />
        Tip: Clicking on the Submit button when number of characters are
        less than 50, results in a postback to same page. If you exceed 50
        characters, the exceeded characters are printed below the textbox
        and a postback is prevented.
    </div>
    <br /><br /><br /><br /><br /><br />
    <div id="divDemo" class="w2">
    This demo is from my EBook 
    <a href="http://www.dotnetcurry.com/ShowArticle.aspx?ID=403">51 Tips, Tricks and Recipes using jQuery and ASP.NET Controls
    </a>
    <br /><br />
    Visit <a href="http://www.dotnetcurry.com/BrowseArticles.aspx?CatID=63">DotNetCurry</a> and 
    <a href="http://www.devcurry.com/search/label/jQuery">DevCurry</a> for more tips and tricks on jQuery 
    and ASP.NET
    </div> 
    
    </form>
</body>
</html>