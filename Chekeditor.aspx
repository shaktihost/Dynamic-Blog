<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chekeditor.aspx.cs" Inherits="Chekeditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
     <script>
         window.onload = function () {
             CKEDITOR.replace('myeditor');
         };
    </script>
    <script src="ckeditor/ckeditor.js"></script>

   <%-- <script src="admin/ckeditor/ckeditor.js"></script>--%>
     <script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
   <%-- <textarea name="myeditor" placeholder="Product Details" class="form-control" rows="12" cols="50"></textarea>--%>
    <textarea id="myeditor" name="myeditor" placeholder="Product Details" class="form-control" rows="12" cols="50"></textarea>
        <script>
            CKEDITOR.replace('myeditor');
    </script>
    </div>
    </form>
</body>
</html>
