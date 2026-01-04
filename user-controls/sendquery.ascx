<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendquery.ascx.cs" Inherits="user_controls_sendquery" %>
<script src="../js/CommonValidation.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">

    function echeck(str) {

        var at = "@";
        var dot = ".";
        var lat = str.indexOf(at);
        var lstr = str.length;
        var ldot = str.indexOf(dot);
        if (str.indexOf(at) == -1) {
            alert("Invalid Email ID!"); s
            return false;
        }
        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert("Invalid Email ID!");
            return false;
        }
        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert("Invalid Email ID!");
            return false;
        }
        if (str.indexOf(at, (lat + 1)) != -1) {
            alert("Invalid Email ID!");
            return false;
        }
        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert("Invalid Email ID!");
            return false;
        }
        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert("Invalid Email ID!");
            return false;
        }
        if (str.indexOf(" ") != -1) {
            alert("Invalid Email ID!");
            return false;
        }
        return true;
    }
    function ValidateEnquery() {

        if (document.getElementById("<%=txtfullname.ClientID%>").value == "" || document.getElementById("<%=txtfullname.ClientID%>").value == "Full Name...") {
            alert("Please Enter Your First Name!");
            document.getElementById("<%=txtfullname.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=txtcompanynames.ClientID%>").value == "" || document.getElementById("<%=txtcompanynames.ClientID%>").value == "Company Name...") {
            alert("Please Enter Your Company Name!");
            document.getElementById("<%=txtcompanynames.ClientID%>").focus();
            return false;
        }

        if (document.getElementById("<%=txtContactNo.ClientID%>").value == "" || document.getElementById("<%=txtContactNo.ClientID%>").value == "Contact No...") {
            alert("Please Enter Your Contact no!");
            document.getElementById("<%=txtContactNo.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=txtEmailid.ClientID%>").value == "" || document.getElementById("<%=txtEmailid.ClientID%>").value == "Email ID...") {
            alert("Please Enter Your Emailid!");
            document.getElementById("<%=txtEmailid.ClientID%>").focus();
            return false;
        }
        if (echeck(document.getElementById("<%=txtEmailid.ClientID%>").value) == false) {

            document.getElementById("<%=txtEmailid.ClientID%>").focus();
            return false;
        }

        if (document.getElementById("<%=txtMessage.ClientID%>").value == "" || document.getElementById("<%=txtMessage.ClientID%>").value == "Message...") {
            alert("Please Enter Your Message!");
            document.getElementById("<%=txtMessage.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=txtcode.ClientID%>").value == "" || document.getElementById("<%=txtcode.ClientID%>").value == "Answer...") {
            alert("Please Enter Your Answer...!");
            document.getElementById("<%=txtcode.ClientID%>").focus();
            return false;
        }
        return true;
    }
</script>


<table id="Table1" border="0" cellspacing="0" cellpadding="0" width="78%" style="border-radius: 4px 4px 4px 4px" runat="server">
    <tr>
        <td valign="top">
            <table id="Table2" border="0" cellspacing="0" cellpadding="0" width="100%" style="-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px;"
                runat="server">
                <tr>

                    <td>
                        <table id="Table3" border="0" runat="server" cellspacing="0" width="100%" cellpadding="0" style="border-radius: 8px 8px 8px 8px;">

                            <tr>
                                <td style="height: 15px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtfullname" onblur="if(this.value=='')this.value=this.defaultValue;"
                                                    onfocus="if(this.value==this.defaultValue)this.value='';" 
                                                    Text="Your Name..."
                                                    class="form-control form-control-name" Width="300">Full Name...</asp:TextBox>
                                            </td>
                                            <td style="width: 10px"></td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtEmailid" onblur="if(this.value=='')this.value=this.defaultValue;"
                                                    onfocus="if(this.value==this.defaultValue)this.value='';" 
                                                    class="form-control form-control-email" Width="300">Email ID...</asp:TextBox>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 15px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtcompanynames" onblur="if(this.value=='')this.value=this.defaultValue;"
                                                    onfocus="if(this.value==this.defaultValue)this.value='';" 
                                                    Text="Your Name..."
                                                    class="form-control form-control-subject" Width="300">Company Name...</asp:TextBox>
                                            </td>
                                            <td style="width: 10px"></td>

                                            <td>
                                                <asp:TextBox runat="server" MaxLength="14" onkeypress="return AllowOnlyNum(event)"
                                                    ID="txtContactNo" onblur="if(this.value=='')this.value=this.defaultValue;" onfocus="if(this.value==this.defaultValue)this.value='';"
                                                    
                                                    class="form-control form-control-subject" Width="300">Contact No...</asp:TextBox>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 15px"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="Table4" width="100%" border="0" cellspacing="0" cellpadding="0" runat="server">
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtMessage" TextMode="MultiLine" Height="100" onblur="if(this.value=='')this.value=this.defaultValue;"
                                                    onfocus="if(this.value==this.defaultValue)this.value='';" 
                                                    class="form-control form-control-message" Width="613">Message...</asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="13"></td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="Table5" width="600" border="0" cellspacing="0" cellpadding="0" runat="server">
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtcode" onblur="if(this.value=='')this.value=this.defaultValue;"
                                                    onfocus="if(this.value==this.defaultValue)this.value='';" 
                                                    class="form-control form-control-subject" Width="300">Type Answer...</asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;<b>Type the first letter Of AIRPORT ?</b>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmemessage" ForeColor="Red" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 15px"></td>
                            </tr>
                            <tr>
                                <td height="13"></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnSubmit" class="btn btn-primary solid blank" Style="font-size: 17px; font-family: Calibri;" runat="server" OnClick="btnSubmit_Click"
                                        Text="Send Message" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="6">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="height: 15px;"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="9"></td>
    </tr>
</table>
